Subject: Re: [PATCH] [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible
	flash  chip driver
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0909221630n62b72c86we8c01ec062acdade@mail.gmail.com>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
	<1253390936.6317.33.camel@macbook.infradead.org>
	<8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
	<1253394106.6317.38.camel@macbook.infradead.org>
	<8bd0f97a0909221605j1f4a0d62m5707e0ad11c7ece4@mail.gmail.com>
	<1253661650.27055.494.camel@macbook.infradead.org>
	<8bd0f97a0909221630n62b72c86we8c01ec062acdade@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 22 Sep 2009 16:39:51 -0700
Message-Id: <1253662791.27055.522.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-09-22 at 19:30 -0400, Mike Frysinger wrote:
> 
> nah, none of the first 0x10 bytes are 0xff:
> 00000000  7f 1d bb 58 8f 04 4c 6d  f5 ee 55 d6 79 b4 31 51
> |...X..Lm..U.y.1Q|
> 
> this is the only board ive seen that has this part, but i can do a
> sampling of different revisions to make sure they're all 0xff.  if
> you're ok with the small changes i mentioned, then i'll post a patch
> for that (to replace the original proposed chip driver) and call it a
> day.

Sounds good. If you can get it to me in the next half hour or so, I'll
sneak it into my 2.6.32 pull request.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
