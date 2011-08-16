Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtPWm-00016m-JK
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 19:42:21 +0000
Received: by wyh11 with SMTP id 11so211710wyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 12:42:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313507201.2679.2.camel@sauron>
References: <1312350638-25566-1-git-send-email-b35362@freescale.com>
	<1313507201.2679.2.camel@sauron>
Date: Tue, 16 Aug 2011 12:42:15 -0700
Message-ID: <CAN8TOE8sD3cPjkTrLWMXFH58gURTuiBWYDFA+XLK_MKDMb9-5g@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: fix corrupt cleanmarker with flash_erase -j
	command
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: b35362@freescale.com, linuxppc-dev@linux.freescale.net,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Li Yang <leoli@freescale.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2011 at 8:06 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-08-03 at 13:50 +0800, b35362@freescale.com wrote:
>> From: Liu Shuo <b35362@freescale.com>
>>
>> Flash_erase -j should fill discrete freeoob areas with required bytes
>> of JFFS2 cleanmarker in jffs2_check_nand_cleanmarker(). Not just fill
>> the first freeoob area.
>
> Hmm, shouldn't we instead make MTD_OOB_AUTO be available for userspace
> via an ioctl instead and make flash_eraseall use it instead?

`nandwrite -o' does a similar thing, where it uses MEMGETOOBSEL to
find open spaces in OOB. Both MEMGETOOBSEL and ECCGETLAYOUT have been
declared obsolete. Plus, the code that uses any of these is somewhat
complicated and duplicated, so I agree that new code probably should
use some form of the internal MTD_OOB_AUTO.

Perhaps this can just be integrated into the new ioctl I'm writing as
a "mode" choice? See the thread:
http://lists.infradead.org/pipermail/linux-mtd/2011-August/037316.html

Brian
