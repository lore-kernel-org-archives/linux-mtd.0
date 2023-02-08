Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D8BC636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 01:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEFiTIAegMj66yD9K4oK5n8aMYrctpw7Pd47sh0wjIs=; b=XKRUArYZDdTbNt
	RX0r0e1E844QfMRRxpXg4VXYx+ntywOgjBX9TquCoN+wAxBxll9hMyqOeVXSIvcJXRhP9Fv5HBcBB
	NMhDzHX05yTUZCyLshr/vWZUU23n4wngLwc/6V8mxyAZGFjwfgsQRzR/Flcfs6wilvi4q/XBLrmNG
	t7XR3tiug462x/o5GxRe7eMwTFlOqRk3O1lSpgmyy1eDRfm/01SUZUeQ3jRFK+b37jOPjSBYAmSPN
	4ENOJ65F7EYv4Opw7L8E//Q2cLkDEhcK1sZ1FVIMDbPzmXAnPcJrPdD6K7Th0XX02jg2lDoZoi7zM
	/RCNqJlnaTpY+Fkjl/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPZJJ-00DmqD-Em; Wed, 08 Feb 2023 01:31:45 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPZJD-00Dmp1-1J; Wed, 08 Feb 2023 01:31:39 +0000
Message-ID: <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
Date: Tue, 7 Feb 2023 17:31:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
> Hello Christoph!
> 
> On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
>> On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
>>> We have had a discussion between multiple people invested in the SuperH port and
>>> I have decided to volunteer as a co-maintainer of the port to support Rich Felker
>>> when he isn't available.
>>
>> So, this still isn't reflected in MAINTAINERS in linux-next.  When
>> do you plan to take over?  What platforms will remain supported and
>> what can we start dropping due to being unused and unmaintained?
> 
> I'm getting everything ready now with Geert's help and I have a probably dumb
> question regarding the MAINTAINERS file change: Shall I just add myself as an
> additional maintainer first or shall I also drop Yoshinori Sato?
> 
> Also, is it desirable to add a "T:" entry for the kernel tree?

Yes, definitely.

thanks.
-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
