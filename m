Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEWH6-0004hY-Fy
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 12:37:41 -0500
Received: by wproxy.gmail.com with SMTP id 36so648264wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 09:37:41 -0800 (PST)
Message-ID: <7e75d4110503240937533ea59f@mail.gmail.com>
Date: Thu, 24 Mar 2005 11:37:38 -0600
From: Matthew Hudson <hexsane@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: /dev/mtd0 No such device or memory address
Reply-To: Matthew Hudson <hexsane@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux Kernel 2.6.11.5 + MTD CVS as of March 23rd, 2005

PCMCIA linear flash cards tested
2MB
4MB
16MB

I've reached my wits end here.

stab shows all the devices I have inserted

/dev/mtd0 and /dev/mtd1 exist.

memory probe appears to exclude all of the memory ranges for the CardBus slots.

dd if=/dev/mtd0 of=check renders the error in the subject line.

pcmcia/config:
device "pcmciamtd" module "pcmciamtd"

card "Anonymous Memory"
  anonymous
  bind "pcmciamtd"

card "Memory Card"
  function memory_card
  bind "pcmciamtd"

I'm thinking I have simply overlooked something. Any ideas welcome. If
you need more information I will provide it.

-Matt
