Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16q8Rk-0001Gb-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 08:06:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020327080151.2CD8C36F9@sitemail.everyone.net> 
References: <20020327080151.2CD8C36F9@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Mar 2002 08:06:12 +0000
Message-ID: <15554.1017216372@redhat.com>
Subject: (no subject)
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

zeusj@firstlinux.net said:
>     Can you tell me why only my mtd char device with even minor deivce
> number works? and there is no such thing happened on my mtd block
> device. 

Did you run the MAKEDEV script or try to make your devices by hand? If you 
did them by hand, did you do so without referring to Documentation/devices.txt?

grep -A6 " 90 char" /usr/src/linux/Documentation/devices.txt 

--
dwmw2
