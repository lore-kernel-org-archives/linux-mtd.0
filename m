Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y68pz-0004j4-3v
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 02:16:40 +0000
Message-ID: <54A35C3C.7070301@huawei.com>
Date: Wed, 31 Dec 2014 10:15:24 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>
Subject: Re: Does UBIFS NAND ECC info get stored in OOB?
References: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
In-Reply-To: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/31 3:44, Steve deRosier wrote:
> 
> So, does UBIFS utilize the OOB area to store ECC bits?  And if not,
> where/how does it store this information?

No, UBIFS doesn't use OOB area.

See func ubi_io_mark_bad() in drivers/mtd/ubi/io.c. If an eraseblock
turns to bad, UBI driver uses mtd interface to mark this eb as bad.

> 
> I'm starting to assume that you're simply saying that UBIFS itself
> doesn't use the OOB area, nor even handles the ECC itself, but that's
> up to the chip driver layer. And that the driver will handle the ECC
> and OOB as appropriate.  Am I correct?
>

Yes, you are right.

UBIFS doesn't directly write to OOB area. MTD or nand controller is
responsible to the data management in OOB area.

I think the announce "neither UBIFS nor UBI use OOB area" is compared
to the filesystem which directly write data to OOB area across the
interface provided by lower layer. For example, Yaffs2? I not sure
of it.

>
> And yes, I understand the 3.8 kernel is old, and we're upgrading, but
> I'm trying to figure out why we're having the problems as I'm assuming
> it's not a bug in the code but more of a configuration or process or
> hardware issue.
>

What kind of problems?

Thanks,
Hu
