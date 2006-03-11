Received: from gateway-1237.mvista.com ([63.81.120.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHxn1-0004bo-Nc
	for linux-mtd@lists.infradead.org; Sat, 11 Mar 2006 01:41:28 -0500
Message-ID: <4412701A.2070202@mvista.com>
Date: Fri, 10 Mar 2006 22:37:14 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Adam Ward <adamward2005@yahoo.co.uk>
References: <20060311013956.53555.qmail@web86904.mail.ukl.yahoo.com>
In-Reply-To: <20060311013956.53555.qmail@web86904.mail.ukl.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Nicolas Pitre <nico@cam.org>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adam Ward wrote:
...
> but the flash is 2 * 28F256L18B - only difference
> being it's 2 * 28F128L18B parts on the Mainstone. (I
> think that's on C5 revision processor cards?)

The L18 StrataFlash chips featured on some Mainstone II boards do power 
up with all blocks locked.  Run flash_unlock on writeable partitions 
prior to mounting.

-- 
Todd
