Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rW8V-0002mI-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 05:08:23 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Venkat Raghu <venkatraghu2002@yahoo.com>,
	linux-mtd@lists.infradead.org
Subject: Re: newbie
Date: Wed, 18 Sep 2002 16:04:25 +1200
References: <20020918034458.23918.qmail@web40004.mail.yahoo.com>
In-Reply-To: <20020918034458.23918.qmail@web40004.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020918040819.D4EEF4388@tiger.actrix.co.nz>
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

It sounds to me like you need to first understand what flash memory is. I 
don't know if there is a faq that describes this.

On Wed, 18 Sep 2002 15:44, Venkat Raghu wrote:
> Hi,
>
> Any pointers to documents describing the basics
> of mtd drivers. I would like know how it works, what
> are the operations. Whats the reason behind erase
> operation etc.

To answer that one question. Flash memory cannot just be reprogrammed, in 
many/most instances you first need to erase the section of flash before you 
can reprogram it. All the limitations are far too complex to answer in an 
email like this though.

-- Charles
