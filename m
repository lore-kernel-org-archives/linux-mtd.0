From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4195EF83.8050104@yandex.ru>
References: <4195EF83.8050104@yandex.ru>
Content-Type: text/plain
Date: Sat, 13 Nov 2004 11:38:19 +0000
Message-Id: <1100345900.8015.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 prints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-11-13 at 14:26 +0300, Artem B. Bityuckiy wrote:
> But the main thing why I think it would be nice to introduce macros like 
> these is that the messages will be a bit standard. I mean that all 
> errors will have the same prefix. It is useful when you develop JFFS2 
> with debugging output on. In this case you will just s/JFFS2 Error and 
> see all the error messages. But currently, it is hard to find all the 
> error messages in JFFS2 because some of them use prefix "Error", some 
> just contain the word "failed", etc.

I'm not sure that just a standard prefix will really help with
debugging. The trick is still to know what's important, and what's
noise. And running it with full debugging is slow enough already over a
115200 baud serial line, without adding more stuff to each line :)

I'd much rather see an effort to weed out the unnecessary prints at
debug level 1, moving them to level 2. I don't consider level 2 to be
particularly useful in general; it's _too_ verbose. 

-- 
dwmw2
