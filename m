Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQHkY-0004lE-De
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 16:22:35 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jonas Gorski <jogo@openwrt.org>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, antoine.tenart@free-electrons.com
Subject: Re: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CAOiHx==8WbSqy=1XPGR5G4=hFouV55bNe_Y82k1Pby4+Yn+rxw@mail.gmail.com>
Date: Fri, 14 Aug 2015 18:18:06 +0200
In-Reply-To: <CAOiHx==8WbSqy=1XPGR5G4=hFouV55bNe_Y82k1Pby4+Yn+rxw@mail.gmail.com>
 (Jonas Gorski's message of "Fri, 14 Aug 2015 18:12:22 +0200")
Message-ID: <871tf5c08x.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jonas Gorski <jogo@openwrt.org> writes:

>>
>> -               info->data_size = 8;
>> +               info->data_size = READ_ID_BYTES;
>
> You are reducing ->data_size from 8 to 7 here, is this intentional?
I bet it's a small mistake.

The pxa3xx NFC controller requires to read at least 8 bytes, as it is one entry
FIFO (chapter 3.7.1.2 "Non-DMA Operating mode" of PXA3xx VolII developer
manual).

Same constraint applies to DMA btw.

Cheers.

-- 
Robert
