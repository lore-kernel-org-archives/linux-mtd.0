Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gx0MW-0000NT-LG
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 07:15:59 -0500
Message-ID: <45892981.7070203@ru.mvista.com>
Date: Wed, 20 Dec 2006 15:16:01 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Michel LECONTE <michel.leconte@sacet.com>
Subject: Re: Reduce boot time with jffs2 and CM-X255
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
	<4588F67A.6080602@sacet.com>
In-Reply-To: <4588F67A.6080602@sacet.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Enrico Migliore <enrico.migliore@fatti.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Michel,

Michel LECONTE wrote:
> I use a CM-X255 with a NAND Flash of 512 Mo
> where roughly 250 Mo are used (90 Mo for the native distribution
> provided by Compulab and 160 Mo for specific applications).
>   
I think that first of all this is a design problem. If you want smaller 
boot time, you need to figure out what exactly you need during the boot 
time and create minimalistic partitions. Anything else can be mounted 
later on.
Moreover, for the stuff that is effectively read-only I would recommend 
using read-only filesystem such as cramfs with a read-only translation 
layer, like this one: 
http://lists.infradead.org/pipermail/linux-mtd/2006-December/016973.html.

Well, that all doesn't mean you shouldn't use SUMMARY for your JFFS2 
filesystem. :)

Vitaly
