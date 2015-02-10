Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL79V-0000Sf-Nh
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 09:30:42 +0000
Received: by mail-vc0-f176.google.com with SMTP id la4so3063457vcb.7
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 01:30:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1423555541.2573.63.camel@sauron.fi.intel.com>
References: <54D97D9E.3040606@huawei.com>
 <1423555541.2573.63.camel@sauron.fi.intel.com>
Date: Tue, 10 Feb 2015 10:30:18 +0100
Message-ID: <CAFLxGvwJ9LhbPhcyEyq91+_jLDcd1XtbmcCHTGCSSk+J4ZCTWw@mail.gmail.com>
Subject: Re: [PATCH] UBI: improve messages in ubi_eba_read_leb()
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 10, 2015 at 9:05 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2015-02-10 at 11:40 +0800, hujianyang wrote:
>> If an error occur while reading from PEBs, for example, an ECC error,
>> ubi_io_read() will print some error messages. But it's not enough for
>> debugging. These messages don't show the mapping info for a read from
>> UBIFS layer.
>>
>> Although UBIFS will soon print its error messages after catching the
>> return value from UBI layer,  multi-path reading will confuse the
>> relationship between LEBs and PEBs showed by these messages, like:
>>
>> [   38.442770] UBI error: ubi_io_read: error -74 (ECC error) while reading 26624 bytes from PEB 54:104448, read 26624 bytes
>> [   38.852461] UBI error: ubi_io_read: error -74 (ECC error) while reading 77824 bytes from PEB 346:53248, read 77824 bytes
>> [   38.864142] UBIFS error (pid 1444): ubifs_recover_leb: corruption -3
>> [   38.870487] UBIFS error (pid 1444): ubifs_scanned_corruption: corruption at LEB 928:55280
>> [   38.878625] UBIFS error (pid 1444): ubifs_scanned_corruption: first 8192 bytes from LEB 928:55280
>> [   38.892117] UBIFS error (pid 1444): ubifs_recover_leb: LEB 928 scanning failed
>> mount: mounting ubi1:bak on /mountpoint: failed: Structure needs cleaning
>>
>> This patch improve the output of ubi_eba_read_leb() by printing the
>> mapping of LEB and PEB if an ECC error occur. And also, print PEB
>> and LEB number if a CRC error occur.
>>
>> Signed-off-by: hujianyang <hujianyang@huawei.com>
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

As the merge window is already open I'd wait until the next merge
window with that patch.

-- 
Thanks,
//richard
