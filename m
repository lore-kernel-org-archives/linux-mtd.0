Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A26DC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vK0CIhaRz4DIHp1cDhDSIsSycdhueYgwIiZYeMXyrDw=; b=3VD+WsSUOSHo0+
	9jUPYEk2jlH4o728OUYNWCW8xtnsgG4v9qV/oWK0OyasX+g4HRQBVz8OCNsqJL1XlupYg9QJ9VwMO
	u7Nbhzk1xKb45dkfJ4dt+lsIS1VlZ4zfP4N5Nib8v87ZT/5uhedpalZzOnocPB+ogrT/Ee5SeIvhy
	ATxXtEQFPMCLwLzgDX/lcb5kQdJIX5N8rXKglUPr88+nNko4GfpmKj9jUJxtcdkSysVg2E3rV7t1L
	ZHPfyq/9L//7raeykZGq1h3v+z/bfNRPl7LND9eNmAJxW8b8MU1pq/JsToYI2A9CGLh6qHCEjPbHz
	VI3R6R/3VF+KwgeA74cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odGDn-00CQ3d-0x; Tue, 27 Sep 2022 19:26:23 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odGDk-00CQ2g-AW
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 19:26:21 +0000
Received: by mail-ed1-x532.google.com with SMTP id c30so13370399edn.2
        for <linux-mtd@lists.infradead.org>; Tue, 27 Sep 2022 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5au5+3PbElHSXVdPLVjWvdG37svmAe3WhQcNrik3Eeo=;
        b=oNN2HAKsxJv404M7NtuxHckdxY0zzeDG1pNMLqcK4w0sghJDCq+RtWa73h6jMU6ukU
         Hi/SbS0eZJOUpynkO3iLKHgpmXkNT4pFtFPGuzaMLk3VS0rsDXuM6k2fSHV2jiJlHaZk
         9zpvJl1hvdLJR+HQitn2K1to5VX9pfhkQfvKoLyECXRkI7tVTFKTKrW8Ji5CwyIn+rPM
         knHVxJM8JPnoLFlw9bX1hme6GVSGCKEC2by8TZplwOmhIsqq3a424vFgyNvfS8h8W7ak
         dLOdSqqGq0Omlb3lyV+bdgaZ1l6YjhhW9b5COTfLZD+rL5WqFs4Kcj/WkTul5zy0Er2G
         BO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5au5+3PbElHSXVdPLVjWvdG37svmAe3WhQcNrik3Eeo=;
        b=COLiSoR4twJBxeH5ZLVnchmLdRjBT3ZMJsaG7AzujSgH+Cy843ZTHsdhfidBsu0Adg
         83gStlC9LbCpfUKDDhHVHG8e9hV+BXQPtAUar1d/0s4W4FdisI59VDxlGNS0YY8+OMNP
         T+oyTsilCTwb3BLeC0c2wxIoI04NfC7mAcifC4YX4k2YLzeTTaaFEk55CJmZE2Zx8flP
         6kBBXx6WKCDzOqAzXo0w6/8Fd1wkeKIAPrQn3z2yD/aGucYkFreXZ6B9m6P/Q7FjWB9i
         qaj+WyaFJUO7HMkq/mXPr14vn0cxW5cD+prMlPzbS8Dqn3UuS36TG5RN3O+CNdH/0Zcw
         gy3Q==
X-Gm-Message-State: ACrzQf3km0XE0WYV9Evd2nmsA6RBOK3qz7Pyv71ekV4YPeHx3pM8rf5U
	YzeOxwS0ZXOnst6aI72Up/gvpGjRYXcHgOUXxoc=
X-Google-Smtp-Source: AMsMyM7LBV2jOqEb/+HwaxfdocVmYIfy3ArIVEMNEqdaM1y56sYfVXYyQAck6igJjZMp/XNs2blyMRNKhftHGDWrIo0=
X-Received: by 2002:aa7:c04d:0:b0:454:2f81:b966 with SMTP id
 k13-20020aa7c04d000000b004542f81b966mr29698687edo.269.1664306778431; Tue, 27
 Sep 2022 12:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220924131010.957117-1-yangyingliang@huawei.com>
 <CAFBinCCFSrYv-JZrda27Ein=YrEik=yvOjHtiz-=aR0q-+FFFA@mail.gmail.com> <e640b2b7-edf7-54dd-c207-a0906858d98c@huawei.com>
In-Reply-To: <e640b2b7-edf7-54dd-c207-a0906858d98c@huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Sep 2022 21:26:07 +0200
Message-ID: <CAFBinCAUGQXjevOcpD0X2XR7+1MKWuLPJcGShtHSJMjSGfCU6A@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: rawnand: intel: Add missing of_node_put() in ebu_nand_probe()
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_122620_458490_160990C0 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, Sep 26, 2022 at 3:58 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
[...]
> >> +err_of_node_put:
> >> +       of_node_put(chip_np);
> > Here I have one question:
> > My understanding is that with this patch we now use
> > of_node_put(chip_np); in case any error occurs during probe.
> > But what about the case where there's no error and someone later
> > unloads the driver (using rmmod)? Or in other words: do we need
> > another of_node_put() call in ebu_nand_remove()?
> In normal case, when the module is removing, the of_node_put() is
> called in del_mtd_device() which is called by mtd_device_unregister().
Thank you so much for the explanation! With this your patch gets my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
