Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F2CCA473
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sWxahkD/Vyt5VuZ+gxY1isUWxtns852BBdfRhQhI2vk=; b=ADJP80C+fRQzND
	99o2FbO644m8X97MuzcxXBZ7qJnNIf5Q0LK4KLOvPlbE8miXv78QGBGjF+VLWx1hUiWP4LxC9YvJJ
	RvQ37c42HglgQKrzrJHjJFj9ZVpECOTX+rsNVQRBL35mVI9MlYhPcJmIfeBRzGeEygWndK40llrWY
	762hHmeNZhCGBbR9wAyaJFH6MdTNm0TzX7GvHSjlRuc63WxDDUSTcz0uwHO6U+4oU3LfwK9dEeTe4
	7NBqVDuEXPqq6VrcOW2lruRAltRGVlC+0DW8DvZ1pZJac+t+askBJ5aMvDXAo6YEdmnuROI+u3/ud
	9ZXS2eMFbdztwaNeP54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwPwW-00GqH4-LG; Wed, 01 Jun 2022 15:07:28 +0000
Received: from smtp1.axis.com ([195.60.68.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwPwS-00GqDo-17
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 15:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654096044;
  x=1685632044;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=xjtIuoxXUELXl+UEmg3UTMIXOqDINNA9RSRcP7yUye0=;
  b=Sc1LCHYuANlU/fXz/2Mjsx4dsV8bcBgcnVmN/C3t6/osd/D/V0suek+f
   a+KgoWL8IQnqMGpKeCdyWobsikbv7NrNzQbRdwuc5uiKcyvdGVkhLhVcz
   JwD6q3HUTEdZa0y2EZkYDXMD7Z23oFfXdITepR5yXTgcZj1DmPA5dpzJV
   IDDsafxB9egKnx3iZW0a2pCheR/QQKPMMV7cnobeB43HobSlwEWVhwdzJ
   K1SYIwED6zbFDLLPKc9hbp/GwoKpxlqu1l8ZDwlREtTkRWHbPWgyvyw8n
   yNcrqE+j68L0sR5WlPoQ+svoC48CYluz2jKw6ES2yzkLPKTtR39Lu9nE4
   g==;
From: Rickard X Andersson <Rickard.Andersson@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Question regarding raw NAND and UBIFS
Thread-Topic: Question regarding raw NAND and UBIFS
Thread-Index: AQHYdaqZkmT2gI2s9kypWG6/OiGb9A==
Date: Wed, 1 Jun 2022 15:07:15 +0000
Message-ID: <535b915640b84befa2d40d072420262a@axis.com>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_080724_590910_DD028C15 
X-CRM114-Status: UNSURE (   4.93  )
X-CRM114-Notice: Please train this message.
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

Hi,

On a system with two raw NAND chips of same type and size is it possible to create a MTD partition that spans over both devices and use UBIFS on that MTD partition? Any drawbacks or risks?

I plan to create a partition that uses 100 % of one NAND and 50 % of the other.

Best regards,
Rickard Andersson
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
