Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jaY5-0004RI-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 08:14:02 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1H00H76QQI7B@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 27 Aug 2002 09:13:31 +0200 (MEST)
Date: Tue, 27 Aug 2002 09:13:08 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Cannot remove child on JFFS2 FS
In-reply-to: <1030428801.3d6b1881e7ed3@imp.free.fr>
To: olivier.eribon@free.fr
Cc: linux-mtd@lists.infradead.org
Message-id: <1030432389.12249.0.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <1030428801.3d6b1881e7ed3@imp.free.fr>
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

On Tue, 2002-08-27 at 08:13, olivier.eribon@free.fr wrote:
> Now, after reboot for each FS mount and for each file on the removed directory, 
> this message appears on console :
> Cannot remove child "fileXXX", ino #0, because it doesn't exist
> 
> How can I solve this problem ? (because this message induce long time to
> mount partition.)
Use latest CVS code. It's fixed there.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
