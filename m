Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EA4C79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 05:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=4mqzVIKly6PzQlCCaRUsFCc90o
	L+/zbAw+QG/4WhzZu6UEKn5sNcvFgurdLCugTJNvk4+g2VCUK1OiggoN8gmlBWr1e/c/ZVTJ/zyRr
	+pCNO2QCpBbBhQd3JP7kiFqL+Cmn2Iire2VCmVcyHXogQSX+l19cbbzkxW+nHpOAKrl+pEvB3QvCy
	iOumIzgF2A5wzLGlkWN1NluR1yLZHV7z1PyVRkQRck8Vm0OE1HgtJRAmMfi+F7M88cd0P1buce/7D
	zGMe6Qrd/M9tm4VosXejb+UF6zST2GipYiwC3xWEAaX/gVkPwgpO7urouMV7XW6RI1nkciNITtb3W
	hc4qy7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Rz9-00000005wDa-2guf;
	Mon, 07 Sep 2026 05:33:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Rz6-00000005wCU-0SLk
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 05:33:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49954b88fffso22656405e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 22:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788759214; x=1789364014; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=tsqBeMQD8qoCkSSwi79D5v1BfCSjWzeh7o6c/e2PgEw00AlX7kNWYnFf2bn3bKPItY
         z51eDIMfEKSdeV0GDs3AlWJcvLbgvPto+R8o2suNQuUUCJ6F+s/CocVU8ReX1izmr1A4
         1yL6D6FyeOBsqX8HXNm+S0Mf0lXHgRNiRs/rStGE0jHJtuzw0N5l5iS0KKmQq37rGoAn
         iAVn6SS4Nb9GE5Nh7KVxg9I6lcwOOL7aebJqJr+Codf2gOrmHO6z0kut5CphSP8uU0bv
         /MGom5B3nmxrbFhexstFC5WDXz1sVP9+3dvPR37RTpc26il3Ig1SwQLQ6lAYd/uMROYE
         YgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759214; x=1789364014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=sHMWWXpvruI1MtlKWgng8H4hfMcpwjAN37B3+XAO9Rj09tCxgUzhNNhbmclujwyRqQ
         UHIDtGA0AiWjsNBBmaFl8/CqOh3sWtiF7zmYxMOWgOkES2W9M8Rdf+VC+8nIaG5Ybvcz
         jqJ15nI81lze0Ng3dYr7qU+ulgrsgy6Nwe5TtmrgZUAedkfO5WHOpceqd27nYl9Xk5eo
         DxYJ+0rUgrixC2jfWLMM4dSyJHwCxvhiLohcrg58v1s26JrE771pUqYZPlxoOuGd7rPs
         78EwlJFwPEna2Ibjvhyh+cjWkfBIM8G4vSahwqNvuyNdXmY47G7rZ9hMH8I8e6qcfOXk
         rKgA==
X-Forwarded-Encrypted: i=1; AKwUvBx6w5ja7xJnlk66tr6VkHUYNJqn3slg6/esYaBt5ZP1WFv45wErjlvCbPRExhmWKKdPC/tslHxxFLY=@lists.infradead.org
X-Gm-Message-State: AFuF++ndsHjOgzYnh0zwUq7Vb244eYITxbopIAL4UVzQSbixIfba8BK6
	8WjQMMN0/wnKJH2Yhl6Jt80q+4AfFeWYrSYyYgfaHijUhRv524WEQVV1FPN4oAs3aS8tuecjOw+
	otm1ULSU=
X-Gm-Gg: AYBFou2Su7mhHarzQI3jVyRDuk3nViThCKkF3mrZIZVNE0bmyn1Syszr2i/FAbpYNlH
	3vjqnFxL4OhasFpgZNacldlCidfKVv4YD+qMumgcs+nhd+JNHmSQVlv0f0jlUr0DAAqA/v69rln
	93R71eWBrZmRCb3ndLDPMj6AGDq1b8+bsZFvp3HIOArVDCwR9fAqnvpnPO1kvkwETB69au8ESSj
	bfUyVpdvInnw+AKF+ob8C982+o5z6x2ejvr8+G2Aaktpe0UwK/HUCtbjtRKRFjxhX7AUVPZbxjI
	7+HYQX9j0nHRgfEy+4a15p0SxkO5hJKHlj54ANUnvFwDdC5qT09hB+5Lzno0w3ePlSf3s4H72vj
	VfjtMIy9hJkYBXjLqMq1Mpj7QaRbV1sqI1nFBnCpBMJbzXBewtzoyQnIIaoO5B+TQv6m2pXtljy
	3A0tk1iPAWmXitnxmHpt4OGAmYaawQOwAGIYUBBQf1C74FEkyU9t621w0LbF7WPLw+sSVr6/B1I
	v3uHC6aUIR6oDthWAQs
X-Received: by 2002:a05:600c:4e16:b0:49c:fc6c:bdfc with SMTP id 5b1f17b1804b1-49cfc6cc01bmr166379295e9.19.1788759214130;
        Sun, 06 Sep 2026 22:33:34 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm27432905f8f.24.2026.09.06.22.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:33:33 -0700 (PDT)
Message-ID: <8c964274-4a4a-4e7d-b337-5334062c6bf3@sigma-star.at>
Date: Mon, 7 Sep 2026 07:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: libmtd: fix sign extension of ioctl request in
 mtd_xlock
To: Bastian Germann <bage@debian.org>, linux-mtd@lists.infradead.org
References: <20260427112422.132746-1-bage@debian.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260427112422.132746-1-bage@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_223336_150834_7DA6EF00 
X-CRM114-Status: UNSURE (   3.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
