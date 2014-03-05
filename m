Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLItH-0008Hn-Co
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 20:58:12 +0000
Message-ID: <53178FC6.6060605@nod.at>
Date: Wed, 05 Mar 2014 21:57:42 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>	<D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>	<52EF772D.8080207@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>	<52EF9FFE.4020405@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>	<52F1F658.9080701@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>	<87zjlxy8lj.fsf@nbsps.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>	<87txc4w698.fsf@nbsps.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>	<D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>	<877g8ojqsn.fsf@nbsps.com>
 <53079725.6080105@nod.at>	<87ios8gsho.fsf@nbsps.com>
 <87k3coq8di.fsf@nbsps.com>	<530860B1.9000808@nod.at>
 <877g8kr1h7.fsf@nbsps.com>	<530B670B.3090002@nod.at>
 <87sir8ms41.fsf@nbsps.com> <87ob1wmrzi.fsf@nbsps.com>
In-Reply-To: <87ob1wmrzi.fsf@nbsps.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Ziegler,
 Emanuel \(Lawo AG\)" <Emanuel.Ziegler@lawo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.02.2014 16:48, schrieb Bill Pringlemeir:
> On 24 Feb 2014, bpringlemeir@nbsps.com wrote:
> 
>> /* could reschedule here... */
>> on 'if (vol->eba_tbl[lnum] != from)' another thread has this
>> 'ltree_entry' so count is >1.
>> /* could reschedule here... */
> 
> Sorry, maybe that is not true.  I don't know enough about the logic of
> ubi_eba_copy_leb().  Another thread has at least changed the physical
> map.  It may/may not still have the rwsemaphore.

Thorsten and Emanuel from Lawo AG kindly gave me access to one of their boards
such that I was able to work directly on the issue.

The solution is rather trivial.
Two commits were missing in their tree:

commit 8afd500cb52a5d00bab4525dd5a560d199f979b9
Author: Adam Thomas <adamthomas1111@gmail.com>
Date:   Sat Feb 2 22:35:08 2013 +0000

    UBIFS: fix double free of ubifs_orphan objects

and

commit 2928f0d0c5ebd6c9605c0d98207a44376387c298
Author: Adam Thomas <adamthomas1111@gmail.com>
Date:   Sat Feb 2 22:32:31 2013 +0000

    UBIFS: fix use of freed ubifs_orphan objects

Bill, I'm very sure this fixes also the issue you face.

It is not obvious that these two commits fix the issue.
I've spend some time to figure out what exactly happens.

In most cases up_write() crashes because "waiter" in __rwsem_do_wake()
or __rwsem_wake_one_writer() somehow became NULL.
It turned out that sem->wait_list gets overwritten.

"UBIFS: fix double free of ubifs_orphan objects" fixes more than a double free.
It addresses an issue where an orphan stays too long on the orphan list and therefore could
be free()'ed twice. But another issue is that in ubifs_orphan_start_commit()
an already free()'ed is set to NULL.
Namely by the line "*last = NULL;".
This is the line of code where the memory corruption happens.
I've double checked it by adding a few trace_printk() and BUG_ON().

Thanks,
//richard
