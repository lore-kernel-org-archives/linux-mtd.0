Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91CDC44512
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 04:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5kXmucwr9PQo2shMtDcuf4bwWeW8AjowbrNJsY0KDX0=; b=M0XYDPkOLSjbqb
	HpjXr6JoRinr3Xy5i3UjbqM4wLQwhyFwKp1oTfJYxUrPvOTV5ZwJVODk3WT+n+Z8kJLtAQ9fUwm3T
	HVDlXF/3sdMWdUW3r0NKsawvCDOG8/NLrJUM5ZLtKnADE6GSo8ro/RV30fRCd995O+MC/5mOk/Cdx
	gzunbVVNjm7Ok9r7oTxq/V6t58pCIQtnZu4OStrlrk02kGV+MdvGJdetmnzl9DW1EBV58w802XGIk
	jwYqu7F6fFkilhSG6HtAOupTa1oV8Az5YfVL1Ujn3pM/tGJZwqyUL4TU96T0BOJF1mqk7u/4yiXF5
	0JNlC5Gs7eiG+Za3j4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOQd-0000000As7N-0kqd;
	Wed, 22 Jul 2026 04:19:31 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOQZ-0000000As6l-3evh
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 04:19:29 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABn1T_NRGBqYj27AA--.34365S2;
	Wed, 22 Jul 2026 12:19:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC] mtd: virt-concat: define duplicate partition handling
Date: Wed, 22 Jul 2026 12:19:25 +0800
Message-ID: <20260722041925.31407-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABn1T_NRGBqYj27AA--.34365S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrykuryrKF47JF1DJF4ruFg_yoW8tF1fpF
	WFgw45Gr4DGFWFkw4DX3WxAa1fta97JFWUJF15Xrn5AwsxXF92kFy2y3Wj9a1kWr1kCr42
	vF4jgF1kCF43AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UTnQUUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_211928_273333_5439BD50 
X-CRM114-Status: UNSURE (   9.42  )
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

mtd_device_parse_register() contains compatibility handling for drivers that
call it more than once, while its comment notes that partition parsing can
register the same partitions again.

When CONFIG_MTD_PARTITIONED_MASTER is disabled and the first call finds
partitions, the master itself is not registered before parsing. A later call
can therefore reach partition parsing again.

With CONFIG_MTD_VIRT_CONCAT, each newly allocated partition whose OF node
belongs to a virtual concatenation reaches mtd_virt_concat_add(). That
function appends the partition based only on the OF node and increments
num_subdev without checking whether the node was already added or whether
the fixed subdev[] array is full.

A repeated parse can therefore append the same node again. If all configured
slots were already populated, the append is out of bounds. If other members
are still missing, the duplicate can make num_subdev reach the configured
count with the wrong membership.

A local bounds check does not seem sufficient for a correct patch:

  - concat_node_list and the concat population state are global, but node
    creation, addition, join creation and destruction have no common
    serialization.
  - mtd_virt_concat_add() returns bool. false means both "not a concat
    member" and "not added". Returning false for a duplicate makes
    add_mtd_partitions() register it as an ordinary partition, while returning
    true without storing it would leak the newly allocated partition.
  - join creation and destruction call back into MTD registration helpers, so
    a driver-global mutex must have a carefully defined scope to avoid
    recursive locking.

My current view is that the fix needs both a serialization contract for the
global virtual-concat state and a tri-state add result, so the caller can
distinguish "not a member" from a duplicate or capacity error and free the
new partition on error.

Would you prefer this serialization to live inside mtd_virt_concat, or should
the MTD registration layer serialize the node-create/partition-add/join
transaction? I have not attached a patch because choosing either scope
without agreement would encode a new lifetime and error-handling contract.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
