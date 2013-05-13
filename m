Received: from lvps176-28-13-145.dedicated.hosteurope.de ([176.28.13.145])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uc0Q3-0007Xb-PU
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 21:36:32 +0000
From: Tim Sander <tim@krieglstein.org>
To: harsh poshtiwala <hiharsh@gmail.com>
Subject: Re: Why UBIFS mounts read only?
Date: Mon, 13 May 2013 23:36:53 +0200
References: <CA+mubHpPN1C662Hpf1x9Xt9gMU6yDwFph6fM0GxnGTGEc2NzOA@mail.gmail.com>
 <21384717.Gehi23U2yB@dabox>
 <CA+mubHrbTSWgcD3O2OiG7e=30U1OEdRpwfSsvJiGhEjBw+ZG=w@mail.gmail.com>
In-Reply-To: <CA+mubHrbTSWgcD3O2OiG7e=30U1OEdRpwfSsvJiGhEjBw+ZG=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201305132336.53239.tim@krieglstein.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Harsh Poshtiwala

Am Montag 13 Mai 2013, 17:06:13 schrieb harsh poshtiwala:
> >> can't open /dev/proc: No such file or directory
> >> can't open /dev/rwmo: No such file or directory
> >> can't open /dev/dpts: No such file or directory
> >> can't open /dev/moun: No such file or directory
These are definetly no proper device names! So there is something fishy in 
your init scripts. Also is "mount -o remount,rw /" working?

Tim
