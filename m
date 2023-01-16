Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D0C46467
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=t1ycUyjV1Gn61RRIGXeiyooJDX+UmXS3JAoUItwa9es=; b=PO9
	NXoJpkepURpuW3kCYtT6dwEh3mZaCO1HyX3KuqXxqkKW4ALsH8aqPxjnKF7jakiSO1QhzlqIwImeK
	zQYH3eIJohF9aoIR53yf2m5ooUO7xx52ZfPVM8tyOa2KQiFhZnsc+IvtdYIfmQ43qlKfd+l1UvF2J
	W5GOLFoynpykYd+DqvZgO6VAqoPTo1fOSTsDS261QBY9lyrj9RhjVQtPPdINHC+zKAHtFgPxU/7e6
	uwlx5nZOl8Ujl6X3sdwSvFXtiGMFKjwvv3oSAH8KSMKHOq9wuWhDsnPWYmrHCap7yzdrHqcsJHaau
	+Ut4/fvtNIOyX7g1HAsWLSh4TmDONIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHPn1-00AXyM-Is; Mon, 16 Jan 2023 13:44:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHPmv-00AXuD-CZ
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 13:44:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id t5so23121156wrq.1
        for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2023 05:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rno1igLp9IqYeH1qSYjcx11MtVviekrTz8yJwoDR31w=;
        b=VW+qXWzMBOKWcFkZKWT3tJxeHqIgrLzdTv+PUHumRPIPjSWHT5sDRt36xoYaeSOrwC
         ntMzdY+OJatrgHJTiRR5ym0X3U3YrXm8AMhkP4MMDZhy5jRUXxltnX65GQiJ4d9ZWVSC
         wZ6GcfNuVEnOFFH11565J1nzqSymfW+WOWT0nIfplsakfx9bk8RQR3TygMKECnx+IktE
         ujRlVh/XmkuDUyJ26kpqhoev2I3T6aSVQf1f16wfpa0eUwffqZefIsmO5eZMVL3ZCDRg
         z4GujhsDzMk0NMs+i9F3NwAzcNwQJrbfxewRFsN/Lnc2j0Fl9vPBlWQ4EqwIXoL1FWNL
         P3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rno1igLp9IqYeH1qSYjcx11MtVviekrTz8yJwoDR31w=;
        b=Rsk/10InouMn1Au9jqy7Dyfun71lFMppRlV57N8ebxG0+O82CPAauF/vXJ5+sZtSoa
         L3vbEKM1lTTGGTbtBzDpBEMGlC7Y1d5b6CCA25CnlZtrvf70FeUI37oRUfkkYvUJhAKa
         TpXtB3x+Xm+ZKEL/sgoafNMDw4ANHnNkxwtCGs7Ph4kl6JMK7CLwOy9pp2q7NiIcS97Q
         8ibc907Wdsgg60x0WWoG3X+R2P5WpjAI52jVbNitF3p7X92FHUBG/mg2PDjXmVu1ZE7s
         5KGwKuTpKu3MSvi6RwFVn7lZqLnPnauHZU4nUeFEoHGVf9YRWW1SVR0cH+N7JU7PbYff
         uBXg==
X-Gm-Message-State: AFqh2kr7qNxcwfuwFuxRdp7o675HhAfME79o7kbMqNc0v/XdkV6RAO57
	sZJVNpUxQSPmUPPC+GcsyK/z0YgI4m/9WxXupTdxkKFfodB4bIK9
X-Google-Smtp-Source: AMrXdXuNwA6LIvVpPBts1loqoG1/Vx6wU/Ge7GRPN0Nr4GPXVjIxGp/3coR/cQJXVEj6wJYE6qnO5eQjMIUfHVc719A=
X-Received: by 2002:a05:6000:14d:b0:2bd:dca4:38d0 with SMTP id
 r13-20020a056000014d00b002bddca438d0mr526306wrx.71.1673876670968; Mon, 16 Jan
 2023 05:44:30 -0800 (PST)
MIME-Version: 1.0
From: Mike Williamson <michael.williamson@criticallink.com>
Date: Mon, 16 Jan 2023 08:44:20 -0500
Message-ID: <CAHEoWwuK_rZfka+skd=CTBf2mjAFL71HX_qC77rCWcaO+qy-vg@mail.gmail.com>
Subject: Question about SPI-NOR micron-st.c driver and OSPI devices.
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_054437_474012_C939B3DB 
X-CRM114-Status: UNSURE (   5.83  )
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

Hello,

I am looking at the drivers/mtd/spi-not/micron-st.c file.

I was wondering why the mt35xu512aba_fixups, and in general the patch below,
were not also applied to the mt35xu02g device entry?  Best I can tell, the
datasheets for the two parts (same family, different densities) look nearly
identical and the

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2333941.html

I ask because we are having some troubles with the mt35xu02g and I am
wondering if we need these fixups to run reliably in octal mode.

Thanks,
Mike Williamson

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
