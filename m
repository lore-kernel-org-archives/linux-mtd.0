Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDD2C5516D
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCsdlb85gQLa2GBEeeistvHWj2EywhLdNnEIpeDHEHg=; b=GtwqDQgSSCUsyF
	I2EqbgXFAbsFaA9w770GApgryVHrG5Ad9H/yu7uvmbKq2g73CSTSdf2giSlZPfmWBaEQYvWuSkFvS
	VmkZU0gTDRxTLTVTFaNLMCNInBVtqyLWnmK6C0y3c3Ggni3gcC75l8zCnnLY/XIndTnWHoR8ytukP
	qAL0sAhDd6qokEv0EmerJWBnpBE5ZYHaqRbMLdAs+HAhSjgJpjkXKG896ZzBzF5ihJBBhejGx9lCU
	uxKJNonwD5Ii1Qus/6zEwW9OLpBJQviebwk8P3cdsFXy3cX06FLBwaZNEnhA37fLnhQ2BuMAo7Pco
	4LXTC4lUbRIbNf/aJSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpo8H-0000000CgyY-1VlP;
	Fri, 31 Jul 2026 14:22:41 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpo8E-0000000Cgxy-2ZyP
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 14:22:40 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABHUD6pr2xqYz9KAg--.33701S2;
	Fri, 31 Jul 2026 22:22:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [RFC] mtd: virt-concat: define duplicate partition handling
Date: Fri, 31 Jul 2026 22:22:33 +0800
Message-ID: <20260731141900.5-virt-concat-close-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <874ihosp56.fsf@bootlin.com>
References: <20260722041925.31407-1-pengpeng@iscas.ac.cn> <874ihosp56.fsf@bootlin.com>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHUD6pr2xqYz9KAg--.33701S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1kZw13Zw4xCry7KF48JFb_yoWkurg_CF
	y0k34DKw10qFsaqr4ayr4FyFWrtay7KwsxCrW8XFs7K3W0qanFqFyqq3sIkrn7Jay8Wr98
	Grn0k347Gr13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjgxUUU
	UU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_072239_031709_8E6E7629 
X-CRM114-Status: UNSURE (   6.64  )
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

Hi Miquel,

I checked the current callers more closely. The only in-tree call site I
found that can invoke mtd_device_parse_register() and then
mtd_device_register() on the same mtd_info is the nr_partitions path in
plat-ram. Its only in-tree producer, pismo, leaves nr_partitions at zero.
I therefore do not have a current in-tree path that reparses the same OF
partition and reaches the duplicate append described in the RFC.

mtd_device_parse_register() also does not hold a global MTD lock across
mtd_virt_concat_node_create(), partition parsing, and
mtd_virt_concat_create_join(); mtd_table_mutex is taken only inside the
individual add/delete helpers. However, the absence of such a lock alone
does not establish a reachable race, and I do not currently have a
reproducer for concurrent component registration.

So the RFC combined an unchecked append with reachability that I had not
established. I will not pursue this version. If I can demonstrate a
concurrent registration path, I will send a focused proposal with that
evidence and keep any serialization inside mtd_virt_concat as you
suggested.

Thanks for the questions.

Pengpeng


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
