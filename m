Received: from mail-out.m-online.net ([2001:a60:0:32:0:1:25:1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RBVyU-0004vu-4i
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2011 18:13:48 +0000
To: Gil Weber <gilw@cse-semaphore.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Flash corruption
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <4E8C26DB.8040105@cse-semaphore.com>
References: <4E8C26DB.8040105@cse-semaphore.com>
Date: Wed, 05 Oct 2011 20:13:35 +0200
Message-Id: <20111005181335.340A218E5B38@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Gil Weber,

In message <4E8C26DB.8040105@cse-semaphore.com> you wrote:
>
> We are using jffs2 in an embedded system with a kernel 2.6.27 and 
> sometimes,
> we see a file system corruption that we can't explain (no power fail, ...).
> This corruption follows some basic write operations to update our software.
...
> Our flash is a Spansion GL128N90 16Mb and we are using CFI command set 

That's a MirrorBit device. MirrorBit is known to have pretty obscure
error modes. 

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Never worry about theory as long as  the  machinery  does  what  it's
supposed to do.                                      - R. A. Heinlein
