Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BZf6D-0005jv-5R
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2004 20:13:20 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Marc Singer <elf@buici.com>,
 linux-mtd@lists.infradead.org
Date: Mon, 14 Jun 2004 02:07:48 +0200
References: <20040613214329.GA2282@buici.com>
In-Reply-To: <20040613214329.GA2282@buici.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200406140207.48467.tglx@linutronix.de>
Cc: 
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 13 June 2004 23:43, Marc Singer wrote:
> I've removed the ununsed, if-def's and commented, code from the
> driver.
>
> As for the C_MAPS loop, there doesn't seem to be a good way to remove
> it.  Even though there is only one 'chip', we still the map_info
> structure for the simple_map_init() and friends.  The number of code
> code bytes to be saved is nomimal.  The change would be to remove the
> array references.  How do they make the code 'confusing'?

That's not a question of code bytes. 

Why does this code need a for (i = 0; i < C_MAPS;...) loop, if there is only 
one chip which has to be detected, neglected or whatever and C_MAPS is 
therefor 1 ?

In fact the whole driver could be replaced by command line options.

-- 
Thomas
