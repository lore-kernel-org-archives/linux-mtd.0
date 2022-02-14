Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277BFC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLkE/98HJ+x/ONCcrNhlYcSUcdufp91DrrZSIhzRLIQ=; b=o0+/Drx5OqgL7/
	/bws3ksDOFaNkOeVGdVCKickWMHGSBH0sSh9w/pdDkMo5ii2TkwFhldi6WbaPyrTD3iPgjqRwYZ4D
	jq5aw2w+ycVCrQxpSqIhzHTJzTqi4rPAxBgZlaxDF04yM7KHoAMDOCwpFkeHJF969BJN+5i8a0PCU
	08GYa8oegWlT7n+xhgVy/QAbOOxujSRotqD9S/RH4y6EzIDfEaoc+sQNyQ95uePVCJ5PlMCyW6BLl
	3fbd0HbAedfLJqdrUKvYYR60Qc20UHPLGgwdjke8SFVTL6MaAIS+ZG7UUmv+7ID+t53dCh9PPfyDb
	9pzY2bRRHntYIQ/snEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJgMo-00Gb1D-G3; Mon, 14 Feb 2022 18:46:30 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJgMk-00GazA-N5
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 18:46:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so4279pja.3
 for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2022 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DgckHGaAkZcrGYa6I90wSGex+wSps1HIk1YzJ1huHBo=;
 b=RJZZX4DXXXc2Vva5RTK54qqa2xE6JBudRSuqI1jH8ljthTNxhlQbRoXtDtgKJ/Vtd3
 9ARstZWodppgVy/ebyhHmFuYiBxh2UAqBhQ/E2HUbJnV47uO0Je2ybKWozhvnHoZFa/n
 PJQElJg2hTvwZbmARt5NeCK94ASxd9CeE+VG/w+N1dmHyu0dDtOclUaqiUiNGpkFSUQg
 FZd/gMLsHHcB5kTYNCETi/yTUZV4pWlqn5DSfzTBdjoGNc8fIJcLvalCCW8W3xbvIE7v
 wuorMvmulrHFt/gA587y5lKfUCWoYEIdYQ5T7VeAAMwZtcUqBjcMest87frN83K7Je1T
 nMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DgckHGaAkZcrGYa6I90wSGex+wSps1HIk1YzJ1huHBo=;
 b=OYX8vQLR2Blkt4X7PMvuOyI7Y7wNbJTyAdvnydbhmOjIFalhzhZMEVpn6l0qWGz27L
 Wylrf0ipm6YEsU6H1JATIMfWcezbFTmLHr+hGkIrOODbBPHi9NxhErdwng6sCxBo3FRj
 alSVMkCtl3Er/Km8fXGUzl82pVDH8NjugU884DXwb+9+a7ScKQiwGVQJBZQwOoSt9sN3
 m5Scpls6VosG1XhrSf/EgD77pqAFu+mCc01Pt/rQj80ZleFPp8+SWoQaL8UxfvN8e38w
 Sv6ehbZA6VBNsiFBeSJfLLO0IFB/VT8qDEtV0hKJgEaLA9faRIIJKMQXqMv2Cl47oCpg
 HE2g==
X-Gm-Message-State: AOAM533ItjOT+ow0zdt/VUvgq+BSIg6pRyIg4hCw4yV5Hkz78QCMKxRn
 qhsuFz/JohEJfyIGFYI/vT8=
X-Google-Smtp-Source: ABdhPJwJMB9C8naMZb2fI5M9G0VerPo7wYHQv0HzQTYEZm+nvYJla2KU96FqYyucOl71Ghs2t/6Q6g==
X-Received: by 2002:a17:90b:4f87:: with SMTP id qe7mr40474pjb.77.1644864385890; 
 Mon, 14 Feb 2022 10:46:25 -0800 (PST)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116])
 by smtp.gmail.com with ESMTPSA id v2sm14583655pjt.55.2022.02.14.10.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 10:46:25 -0800 (PST)
Message-ID: <cedb1604-e024-2738-5b33-15703a653803@gmail.com>
Date: Tue, 15 Feb 2022 03:46:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, Joakim.Tjernlund@infinera.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
 <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
 <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
 <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
 <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
 <66ee55d9-4f20-6722-6097-e53c2108ea07@gmail.com>
 <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_104626_805703_58DFF12D 
X-CRM114-Status: GOOD (  19.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Ahmad-san,

On 2022/02/15 1:22, Ahmad Fatoum wrote:
> Hello Tokunori-san,
>
> On 13.02.22 17:47, Tokunori Ikegami wrote:
>> Hi Ahmad-san,
>>
>> Thanks for your confirmations. Sorry for late to reply.
> No worries. I appreciate you taking the time.
>
>> Could you please try the patch attached to disable the chip_good() change as before?
>> I think this should work for S29GL964N since the chip_ready() is used and works as mentioned.
> yes, this resolves my issue:
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Thanks for your testing. I have just sent the patch to review.
>
>>>>> Doesn't seem to be a buffered write issue here though as the writes
>>>>> did work fine before dfeae1073583. Any other ideas?
>>>> At first I thought the issue is possible to be resolved by using the word write instead of the buffered writes.
>>>> Now I am thinking to disable the changes dfeae1073583 partially with any condition if possible.
>>> What seems to work for me is checking if chip_good or chip_ready
>>> and map_word is equal to 0xFF. I can't justify why this is ok though.
>>> (Worst case bus is floating at this point of time and Hi-Z is read
>>> as 0xff on CPU data lines...)
>> Sorry I am not sure about this.
>> I thought the chip_ready() itself is correct as implemented as the data sheet in the past.
>> But it did not work correctly so changed to use chip_good() instead as it is also correct.
> What exactly in the datasheet makes you believe chip_good is not appropriate?
I just mentioned about the actual issue behaviors as not worked 
chip_good() on S29GL964N and not worked chip_ready() on 
MX29GL512FHT2I-11G before etc.
Anyway let me recheck the data sheet details as just checked it again 
quickly but needed more investigation to understand.

Regards,
Ikegami

>
> Cheers,
> Ahmad
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
