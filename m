Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpOa6-0003ak-Gi
 for linux-mtd@lists.infradead.org; Thu, 22 Oct 2015 22:43:36 +0000
Received: by vkgy127 with SMTP id y127so55347512vkg.0
 for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2015 15:43:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxJ0QuSuTfNZc2fDhJMd5u=LpmRKLg9KydNp2gLZ-t4AQ@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
 <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
 <56058D7B.3050005@nod.at>
 <CA+EcR22DEGWr8v-iMDQBf=NNL3+6SsOBDX6mX5y_O9en4FaPyQ@mail.gmail.com>
 <CA+-FG62yDf2hbEgo6At92pwPOWbXjTSwQ-WrJjX2z2z-VBYZ=Q@mail.gmail.com>
 <CA+-FG61mEsrOu_WGUuCm-xgKM4afxSrw2JyQUwCi8BPJU3gkQQ@mail.gmail.com>
 <561ED48D.5010002@nod.at>
 <CA+EcR22oTADfz0Mo=E45_QEKK0Y47PAc2X15Hp-aEj+XC7v3gQ@mail.gmail.com>
 <CAFLxGvxJ0QuSuTfNZc2fDhJMd5u=LpmRKLg9KydNp2gLZ-t4AQ@mail.gmail.com>
Date: Thu, 22 Oct 2015 17:43:10 -0500
Message-ID: <CA+EcR20xXbqcF3NtTcqmMzip1CW9KeT6mixfKSxWDkXji=1tkw@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Han Xu <xhnjupt@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Roshni Shah <roshni.shah@timesys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry, my mistake. I thought Roshni was testing the SPI-NOR via ECSPI
interface. For the QSPI flash chips we usually mount the UBIFS on it
and run bonnie++ test. I don't have any Vybrid board but I have i.MX
platform which use quite similar QSPI IP, I run the ubi-test on
i.MX6SX with s25fl128s chip but didn't see the issue you met.

I suggest you ignore the UBI layer first and just full fill the flash
with random data and dump the data with dd command for comparison, to
check the data integrity on driver layer.

root@imx_mfgtools:~/test/ubitest# ./runtests.sh /dev/ubi0
Running mkvol_basic /dev/ubi0
Running mkvol_bad /dev/ubi0
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    -2
        alignment 1
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    128
        alignment 1
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 0
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment -1
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 65409
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     -1
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     0
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: ubi_create_volume: not enough PEBs, only 252 available
UBI error: ubi_create_volume: cannot create volume 0, error -28
UBI error: ubi_create_volume: not enough PEBs, only 252 available
UBI error: ubi_create_volume: cannot create volume 0, error -28
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     65408
        vol_type  7
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: ubi_create_volume: volume 0 already exists
UBI error: ubi_create_volume: cannot create volume 0, error -17
UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
UBI error: ubi_create_volume: cannot create volume 1, error -17
UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
UBI error: ubi_create_volume: cannot create volume 1, error -17
UBI error: ubi_open_volume: cannot open device 0, volume 128, error -22
UBI error: ubi_open_volume: cannot open device 0, volume -1, error -22
UBI error: ubi_open_volume: cannot open device 0, volume 128, error -22
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -19
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -19
Running mkvol_paral /dev/ubi0
Running rsvol /dev/ubi0
Running io_basic /dev/ubi0
Running io_read /dev/ubi0
Running io_update /dev/ubi0
Running io_paral /dev/ubi0

On Thu, Oct 15, 2015 at 2:39 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Thu, Oct 15, 2015 at 4:20 AM, Han Xu <xhnjupt@gmail.com> wrote:
>> I didn't test UBI on our board since we mount 4M SPI-NOR on board
>> which is not large enough to test UBI.
>
> So, the driver is completely untested wrt. UBI.
> Maybe UBI uncovers an issue. Wouldn't be
> the first time...
>
> --
> Thanks,
> //richard
