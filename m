Received: from mailc.telia.com ([194.22.190.4])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dzYB-0007Qv-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 21:15:15 +0000
Message-ID: <000b01c2c7df$d7c45d40$020120b0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Marius Groeger" <mag@sysgo.de>, <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.52.0301281755410.19671@mag.devdep.sysgo.de>
Subject: Re: PATCH: support for Arctic/Beech/Ebony
Date: Wed, 29 Jan 2003 22:46:12 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi

> Hello,
> 
> attached is a patch that adds MTD support for a couple of PowerPC
> boards based on the IBM440GP CPU. It also clean up the PPC
> section in the mapping drivers Config.in, making it more robust
> against configuration errors.
> 
> All code was taken directly from linuxppc_2_4_devel, and I didn't
> write it. I shall add commandline paritioning support some time soon,
> though.
> 
> If nobody objects, I will commit it to the repository.

2 comments:
  - You don't need mb() since ioremap will add the
     GUARDED attribute to the mapping.

 - Add support for point()/unpoint().

   Jocke
