Received: from web20309.mail.yahoo.com ([216.136.226.90])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WeR1-0007AU-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 14:12:59 +0000
Message-ID: <20020201142405.79130.qmail@web20309.mail.yahoo.com>
Date: Fri, 1 Feb 2002 14:24:05 +0000 (GMT)
From: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Subject: Fwd: Re: JFFS XConfig 
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1862889785-1012573445=:75678"
Content-Transfer-Encoding: 8bit
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

--0-1862889785-1012573445=:75678
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

>  Thanks for the advice David, however it appears
still not to be
> available with CONFID_MTD enabled. However JFFS is
available!

Er, check if it's also dependent on
CONFIG_EXPERIMENTAL.

Thanks David, Jorn,

It is indeed dependant upon CONFIG_EXPERIMENTAL.
However it appears to fail on build at the network
driver stage with JFFS2 enabled. I have not yet pinned
down exactly why. At this stage i have stuc with JFFS
which should suffice for our immediate needs.

> use your CF drive as backing store for the faked MTD
device.

Is there any documentation available on this
proceedure?

We also are intending to use a 16M CF, what do people
suggest we should do about partitioning. I know that
due to garbage collection it is ineffiecient to
partition such a small device, however i had intended
to mount most of the file system as RO for write
protection. Any comments would be welcome.

Thanks for any help, David

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
--0-1862889785-1012573445=:75678
Content-Type: message/rfc822

X-Apparently-To: monitoreurope@yahoo.co.uk via web20302.mail.yahoo.com; 28 Jan 2002 08:52:11 -0800 (PST)
X-Track: 1: 40
Received: from dell-paw-3.cambridge.redhat.com  (EHLO passion.cambridge.redhat.com) (195.224.55.237)
  by mta469.mail.yahoo.com with SMTP; 28 Jan 2002 08:52:10 -0800 (PST)
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 16VF01-0002fN-00
	for monitoreurope@yahoo.co.uk; Mon, 28 Jan 2002 16:51:17 +0000
X-Mailer: exmh version 2.4 06/23/2000 with nmh-1.0.4
From: David Woodhouse <dwmw2@infradead.org>
X-Accept-Language: en_GB
In-Reply-To: <20020128164940.38134.qmail@web20304.mail.yahoo.com> 
References: <20020128164940.38134.qmail@web20304.mail.yahoo.com> 
To: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Subject: Re: JFFS XConfig 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 Jan 2002 16:51:17 +0000
Sender: David Woodhouse <dwmw2@redhat.com>
Content-Length: 233


monitoreurope@yahoo.co.uk said:
>  Thanks for the advice David, however it appears still not to be
> available with CONFID_MTD enabled. However JFFS is available!

Er, check if it's also dependent on CONFIG_EXPERIMENTAL.

--
dwmw2


--0-1862889785-1012573445=:75678--
