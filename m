Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qerw5-00008d-Uz
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 17:00:24 +0000
Received: by wyf23 with SMTP id 23so993002wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 10:00:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1310021892.3149.121.camel@sauron>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
	<CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
	<1310021892.3149.121.camel@sauron>
Date: Thu, 7 Jul 2011 10:00:19 -0700
Message-ID: <CAN8TOE8Qwdc-pjVbucZJD9qNJ3O4n6WVERNK6_QXbqs06pA+kg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I included some comments along with some of you questions and tried to
summarize and answer more at the end. The end comments may explain the
middle...

On Wed, Jul 6, 2011 at 11:58 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-07-06 at 11:51 -0700, Brian Norris wrote:
>> It seems that, according to the following comment, the master MTD node
>> (which is passed to most of our functions) is never registered and so
>> does not have valid information for printing dev_* information:
>> =A0 =A0 =A0/* NOTE: =A0we don't arrange MTDs as a tree; it'd be error-pr=
one
>> =A0 =A0 =A0 * to have the same data be in two different partitions.
>> =A0 =A0 =A0 */
>
> Sorry, I still don't get it, why mtd partitions do not have names. The
> discussion above is about who will be the parent, while we care about
> making dev_dbg(mtd->dev, ...) print names.

The *partitions* have names, but the master does not.

We end up with a device tree that's something like this:

     <physical_device>
     |_ mtd0 (slave->dev)
     |_ mtd0ro
     |_ mtd1
     |_ mtd1ro
     |_ ...
     ...
     master mtd->dev?

where each partition (and RO counterpart) in the tree is registered
using add_mtd_partitions() and each partition's parent is the physical
device. The master mtd->dev is floating in space, since it isn't
registered anywhere.

I think I meant to copy a different code comment onto the previous
e-mail as well:

     /* ...
      * We don't register the master, or expect the caller to have done so,
      * for reasons of data integrity.
      */

So the master mtd->dev, which is used in much of our MTD
initialization code, is never named and registered properly.

> if we look at 'add_mtd_device()' in mtdcore.c, we see something like
> full initialization:
>
> =A0 =A0 =A0 =A0/* Caller should have set dev.parent to match the
> =A0 =A0 =A0 =A0 * physical device.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0mtd->dev.type =3D &mtd_devtype;
> =A0 =A0 =A0 =A0mtd->dev.class =3D &mtd_class;
> =A0 =A0 =A0 =A0mtd->dev.devt =3D MTD_DEVT(i);
> =A0 =A0 =A0 =A0dev_set_name(&mtd->dev, "mtd%d", i);
> =A0 =A0 =A0 =A0dev_set_drvdata(&mtd->dev, mtd);
> =A0 =A0 =A0 =A0if (device_register(&mtd->dev) !=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_added;
>
> =A0 =A0 =A0 =A0if (MTD_DEVT(i))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_create(&mtd_class, mtd->dev.parent,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MTD_DEVT(i) + =
1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NULL, "mtd%dro=
", i);

When called from mtd_add_partitions, this is only called for each
partition, not the master. That is the crux of the problem.

> And if we look at 'mtd_add_partition()', we see that 'add_mtd_device()'
> is also called, so mtd->dev should be initialized.
>
> What exactly is the problem?

I believe the problem is simply that partitions are named and
registered, whereas the master is not. During initialization, all
debug messages, etc. are run through the master MTD, not the named
partitions. This gives the "(null):" dev_* messages I saw on bootup.
I'm not sure if the master device causes much trouble after
initialization...I think it kinda fades away and leaves the partitions
for interaction with the user.

FYI, I'm looking mostly at cases where there *is* a partition layout.
In cases where there are no partitions, the driver will usually just
call "add_mtd_device" on the master MTD, and so this device be named
and registered properly. This isn't so much an issue, except that it
provides inconsistency between setups that use partitions and those
that don't. (Couldn't we just force everyone to use partitions? Users
who don't need them could just form a single partition for the whole
device...)

Brian
