Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta05.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mXcX-0000XJ-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Mar 2002 10:10:33 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Sun, 17 Mar 2002 02:21:58 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: (no subject)
Reply-To: zeusj@firstlinux.net
Message-Id: <20020317102159.145E2274E@sitemail.everyone.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


>Do you have the correct voltage applied to the Vpen line of the flash chip? 
>I note you don't have a set_vpp() method. Do you need one?

Sure, thanks!

>'insurance'? I expect JFFS2 to be more reliable than JFFS at this point. 
>That was, after all, most of the point in doing a complete rewrite :)

OK, I'll try it:)

and why the message show me that "Invalid ioctl 5401 (MEMGETINFO = 80204d01)
"? I find it is in the method mtd_ioctl , and its in the case "default".





_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
