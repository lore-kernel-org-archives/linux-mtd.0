Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179anG-0003kP-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 01:12:54 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: john riehl <jr@i-bucks.com>, Robert Kaiser <rob@sysgo.de>
Subject: Re: Getting big flash onto motherboards. Will CF work? what   will?
Date: Mon, 20 May 2002 12:07:34 +1200
Cc: linux-mtd@lists.infradead.org
References: <3.0.32.20020517142924.0074ef10@mail.i-bucks.com>
In-Reply-To: <3.0.32.20020517142924.0074ef10@mail.i-bucks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020520001251.556764B930@dragon.actrix.co.nz>
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

> >So, except for the form factor, what is the difference beween these and
> >a CompactFlash (wrt to reliabilty on power failure, etc.) ?
>
> I dont know.  I dont know about CF.  how does cf connect to a system?  what
> happens when cf loses power?  how do you write to a cf system?  can you
> boot from it?
>

We've been through this a few times in this mailing list.

CF conforms to the PCMCIA ATA interface. This effectively provides an IDE 
interface over PCMCIA.

There are basically three ways to hook a CF into your system:
* Through PCMCIA.
* Directly onto the bus (kinda like PCMCIA without the hotplug).
* Directly onto an IDE bus.

The last is perhaps the simplest. You hook the CF onto the IDE bus with a 
simple cable and the system just thinks it is a hard drive. Details for this 
cable are available on the Sandisk www.

-- Charles
