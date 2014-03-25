Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSNmA-0005hT-Qh
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 09:36:08 +0000
Received: by mail-bk0-f53.google.com with SMTP id r7so76283bkg.40
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 02:35:41 -0700 (PDT)
Received: from CHRRIE10.omicron.at (vs162244.vserver.de. [62.75.162.244])
 by mx.google.com with ESMTPSA id bh9sm17582228bkb.16.2014.03.25.02.35.40
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=RC4-SHA bits=128/128);
 Tue, 25 Mar 2014 02:35:40 -0700 (PDT)
Sender: Christian Riesch <christian.riesch@gmail.com>
Date: Tue, 25 Mar 2014 10:35:38 +0100
From: Christian Riesch <christian.riesch@omicron.at>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/4] mtd: cfi_cmdset_0002: Add OTP support for Micron
 M29EW NOR flashes
Message-ID: <129F8D9CF5CA0628D616AD9C@[172.22.2.41]>
In-Reply-To: <b3773cf0-45be-4b83-afcc-c1d1c64065b6@mary.at.omicron.at>
References: <b3773cf0-45be-4b83-afcc-c1d1c64065b6@mary.at.omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

--On March 06, 2014 13:18 +0100 Christian Riesch 
<christian.riesch@omicron.at> wrote:

> Hi,
> This patchset adds support for the reading, writing, and locking of the
> one time programmable (OTP) memory of Micron M29EW NOR flashes.
>

Any comments on this?

Thanks,
Christian

> These flashes have a 256 byte OTP memory, which is called extended
> memory region in its datasheet. The flash is compatible to Spansion S29GL
> and Macronix MX29GL devices, so support for the OTP memory of these
> flashes should also be possible.
>
> Tests with this patchset were done with a single Micron M29EW device
> (512 Mbit, 16 bit) on a custom board with a Texas Instruments AM1808
> system on chip.
>
> Prerequisites:
> - Patch mtd: Add a retlen parameter to _get_{fact,user}_prot_info,
>   commit 102f842b7aafee364659a0a45663d53085638312 in l2-mtd.git
>
> Changes since v1:
> - dropped one patch that changes the detection of M29EW devices,
>   this patch is currently not required
> - added support for locking
> - fixed a few bugs in the loop that walks through the OTP memory
>
> Changes since v2:
> - Added retlet parameter to cfi_amdstd_get_{fact,user}_prot_info
> - Fixed partial write of words
>
> Christian Riesch (4):
>   mtd: cfi_cmdset_0002: Add support for reading OTP
>   mtd: cfi_cmdset_0002: Invalidate cache after entering/exiting OTP
>     memory
>   mtd: cfi_cmdset_0002: Add support for writing OTP memory
>   mtd: cfi_cmdset_0002: Add support for locking OTP memory
>
>  drivers/mtd/chips/cfi_cmdset_0002.c |  350
> +++++++++++++++++++++++++++++++++--  1 file changed, 331 insertions(+),
> 19 deletions(-)
>
> --
> 1.7.9.5
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
