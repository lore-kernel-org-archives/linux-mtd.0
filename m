Received: from lst-amand-152-33-17-184.w82-127.abo.wanadoo.fr ([82.127.60.184]
	helo=polaris.sacet.fr)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gwx3x-00068d-7I
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 03:44:35 -0500
Message-ID: <4588F67A.6080602@sacet.com>
Date: Wed, 20 Dec 2006 09:38:18 +0100
From: Michel LECONTE <michel.leconte@sacet.com>
MIME-Version: 1.0
To: Enrico Migliore <enrico.migliore@fatti.com>
Subject: Re: Reduce boot time with jffs2 and CM-X255
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
In-Reply-To: <4588E35F.8000806@fatti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Excuse me for the lack of informations.

I use a CM-X255 with a NAND Flash of 512 Mo
where roughly 250 Mo are used (90 Mo for the native distribution
provided by Compulab and 160 Mo for specific applications).

At the boot, there's a scanning of the MTD1 (4096 blocks) corresponding 
to the NAND Flash.
This scanning takes 1mn20s. The full boot time, from a reset to the 
login prompt, takes 4mn.
 
I hope that these precisions can be useful.

Thanks for any help or suggestion.


Michel


Enrico Migliore a écrit :
> Hi Michel,
>
> could you be more specific?
> The boot time, in a production environment, is the time that elapses 
> from the board reset to the login prompt.
> How long is that time on your cm-x255?
>
> Enrico
>
>
