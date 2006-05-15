From: David Woodhouse <dwmw2@infradead.org>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
In-Reply-To: <c384c5ea0605151304h66ebfael77a3079326fe5937@mail.gmail.com>
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
	<1147519362.32310.21.camel@pmac.infradead.org>
	<c384c5ea0605130623kbe33713n25c28669022d94e1@mail.gmail.com>
	<c384c5ea0605151304h66ebfael77a3079326fe5937@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 15 May 2006 22:54:12 +0100
Message-Id: <1147730052.2571.4.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-15 at 22:04 +0200, Leon Woestenberg wrote:
> I am curious if this made it into your MTD GIT tree, so I can flag
> this issue as being "streamed up for mainline"? :-)

It did. The MTD git tree is browsable at
http://git.infradead.org/?p=mtd-2.6.git;a=summary

That commit in particular is at
http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=0f5ae3d2e9f49af55eb2a9b7cb54b4c0c2373017

It should be in the 2.6.17-rc4-mm1 kernel which was released today, and
I'll send it to Linus for inclusion immediately after he releases
2.6.17. So it should be in 2.6.18.

-- 
dwmw2
