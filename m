Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EBFC88E7B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67RwtjlKy5M+c4OoKese/RxjQZwda0rgfwl+ZNYePsU=; b=imNAftO4965RJe
	ORO3fV2SiQsqJ2c7WbzJhoc4eEN90o5SXOqTK6LRkHVe7+6v0LVWwLATZfqQk06vkq4MWqWooRSji
	e/jDFwLsWlnDFGsZX/TZwB+H9vJ5cann/G94TFWVH3G58OBwcsDMt3nTbQ0SSIoKss6BL8YI3gxWM
	B9gmy0Np3S1XHUkSCR9auoPPuYxUsPQ1TQRdlBt5F1HuHdy1JaeV/asPpnmqop0RfP8vSnvOXMNWA
	Brg4MaMl3mLjRZwofhcDybBJq9mcfMB89wtxVHbqXx7G5B1pXz0WqTe5SeioPZyUBhMIHhqf5mCro
	9CbxCUL5EmrzZS/qWiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RMi-000000066zI-3X2a;
	Tue, 15 Sep 2026 11:30:20 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RMg-000000066yb-2DAD
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 11:30:19 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e610bd325so430674d50.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 04:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471817; cv=none;
        d=google.com; s=arc-20260327;
        b=assgOuOmbWa9mkIEuFa/CWwC98dVcDuCzV+q7CThyKz2FyVMI/pyUYDRyzOAdqDreM
         X0gTXm4powmb769jCcV5aqWWjCY+Yez4o1JouCGRMC3igdtQyv3Q28KzCIQhusdjq4pz
         wJaO93b5Gehq6OnEj26e9GpnrFgXVjjF0BDdNsOzIk+5Urvul9NCbcDuDzAhLh9Ey6q4
         A+MBr5Xb7PNOWuhelJTjSuOt6n3DDxsxjwOZkTY1Bx2FA+FNEyuE7uNTFSCgfUciT08G
         m1gheTYZQhYE9HwJbx+PJDk35FkeZugNPSQ47RnKtXIZnvu6FAbWkmvvEvuwBit44JCl
         BwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        fh=B1Jue1+4mE3Ow3VWM8rHvc7iegaZNpAeUbxz4B1Z9ac=;
        b=YJ3FG7sCDRSC277ESbTutldgKOipJj+H8/UW77chmGyNceQGCLj8aBddcjvPJzsJQj
         XVYLU9mTTy0K36NyP0obX0SRI9khxTLbSW3+hwTs/UjMkl73uVWkh20VRuig6VB/BV4L
         CatKMMJWpQKl/cjUgY94Jkxx0fb/g5Gwsf3YMcdFBrq2VcJP/czR0C85k/uYqLpUpl7e
         jAMg/Z3zDbtkfkgcIj+e7cw2aciLT2ZqgSFxHrQHevh8liCdsaWvCLqjCBqAFqxISXKF
         3yS35aDraF4tKwCNZjUwoye5NJCfk+LIWsfsMa63jQDDJleSE4dfOZuhVhfmatPIa+Yu
         Tn+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471817; x=1790076617; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        b=Wk7JanIRAhaQKbfyckd/N8vpJFz2LZ/eRqEeSXlMish+sh70V5h1IlovF7jufH9IXb
         Ee/YHK22XwMVUlYHuxLwAqiqk+4qXuB0A8Xrl9hqCTCQiDz3A/p9r/cJDLrz7T+Vqe6V
         SLNWCk9rFyMZ5ZlDqHnRV53N9BsOuva2K5Ov8tqZv5FCAgu6s/y6JVPfZNwscHKjipSj
         hOWkHjro2YxT/qPJ03Xa9SIQqHbMdtDUucJwq1FuxR+GjuYY23snzAVtNpmKi4Ul2kWU
         jfSMPC+UaKMDNwspejSctIGzsAxvZR2PuJVRNIu0247D5XwuL+nA73VO8pNQk1U8OMkH
         xhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471817; x=1790076617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        b=19vOjQj6yU6RPQev0HTiKbbzX4BmBzQRvAoxrad4uV2sJwa/bn3I2F2ULLpUa93lF4
         fXyThOphLzWGsWK1VrjWsRMSVw9qkP4ohaOW5OLvktVRF40lxWDY9ngXH2EVcZ3mE4Qi
         dDU1pCjZNrOIswR3DhjBDwFXWGdYju2BA0cQp6FgVwFS694svDJ8X7ZrTPeRicZuVLl6
         JhHgKaoruAdAy2wgcFjs/LYB0lbBlkG+pbd6BuEv6PUKIV/riy5Y5TiPBB0bMYP7RDrC
         EROfrycnu+zuzsalyb+J8VgdWro6xAPUpKx4CtMRw2i7N+j6kAtiHI6VlWf9f2CjT8GU
         VC/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHbx6xrycczKePdnyk4lx0nu5MoTuccSFwuyyT+1yhIwne5vhgWr+xqIb3R4Q9QlmVuVguZh+gpPI=@lists.infradead.org
X-Gm-Message-State: AFuF++nmZMy78t6pmJzxx5md7gtRl0UYTEzLJO4TwppGhgog/kasKUvP
	E7IaDD/Cm3QtweG1GnIttUfc7m+vvL+jE91oZuwvORMNd9YpDy2lgLhoT2cKkNleMmuMQ/Yznjh
	iei0h9VLORRG5Jq4Wx1AzauKSJU5Ewrs=
X-Gm-Gg: AYBFou1CzPT0r1t8NulQfL3msnsB/WjYN0pX7cnkIvVpEPpWGuu6Vm3ff/abwwuym1i
	GBDINKz7KGCUP708J6d7aCE95E5lPbo87Manf2fzeyjTECd5SxW6NHMFYgqlLGx0MTDg5D7Hv9L
	oN7tAlGTcZ8BF9PULMKCaoqi1MAOIAruIXTS7h1ehljdm6rq4DuLhTOhlZ1bI2TyvvIsVr2Oab7
	wFZwnhmDalPGvE2Oz6ToW108GQ/7OD6Keuh21SlP6i7XcivlSTwoOfwgQecwRIiURFCNu0bEYxo
	tK9LavI2jzGOXY4vs/vARO3Nn0w54uZO3umlMblRglm2ugMuC5aTsj3p
X-Received: by 2002:a05:690c:630e:b0:870:48aa:473e with SMTP id
 00721157ae682-88d19058869mr28240767b3.0.1789471816696; Tue, 15 Sep 2026
 04:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com> <20260910190139.BF6231F000FF@smtp.kernel.org>
 <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com> <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
In-Reply-To: <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 15 Sep 2026 14:30:05 +0300
X-Gm-Features: AcwNN1XZV_KcXpgrsqVgDP23cMB0wTyq2Xl7FjPYm5C4oFYJ8HJyICxhmV6sUvM
Message-ID: <CAFpOueSTBSipye_1VmJBBJSXsn-KBYoKUL=JTA4Ker3nMhFPQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
To: Michael Walle <mwalle@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, pratyush@kernel.org, 
	linux-kernel@vger.kernel.org, takahiro.kuwano@infineon.com, richard@nod.at, 
	stable@vger.kernel.org, miquel.raynal@bootlin.com, 
	linux-mtd@lists.infradead.org, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043018_581830_61BBDE7B 
X-CRM114-Status: GOOD (  11.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTE6MzHigK9BTSBNaWNoYWVsIFdhbGxlIDxtd2FsbGVA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IFNvIGlzIHRoaXMgbm93IHR3byBBSSBhZ2VudHMgY2hhdHRp
bmcgd2l0aCBlYWNoIG90aGVyPwoKQSBmYWlyIGhpdC4gSSBkbyB1c2UgYW4gYXNzaXN0YW50LCBh
bmQgSSBzaG91bGQgaGF2ZSBzYWlkIHNvIHVwIGZyb250CnJhdGhlciB0aGFuIGxlYXZpbmcgeW91
IHRvIGd1ZXNzLiBBbnN3ZXJpbmcgdGhlIGJvdCBvbi1saXN0IGF0IHRoYXQKbGVuZ3RoIHdhcyBh
IHdhc3RlIG9mIHlvdXIgdGltZSBhcyB3ZWxsOyBzb3JyeSBmb3IgdGhlIG5vaXNlLgoKPgo+IFNv
cnJ5LCBidXQgcGxlYXNlIGJlIG1vcmUgcHJlY2lzZSBhbmQgb24gcG9pbnQgYW5kIGRyb3AgdGhh
dCB3YWxsIG9mCj4gdGV4dC4KPgo+IEFuZCBwbGVhc2UgYW5ub3RhdGUgeW91ciBjb21taXRzIHdp
dGggdGhlIEFzc2lzdGVkLWJ5OiB0YWcuCgpVbmRlcnN0b29kLCBhbmQgYm90aCBhcmUgYWRkcmVz
c2VkIGluIHYzOiBhIHNpbmdsZSBwYXRjaCwgYSBtdWNoCnNob3J0ZXIgY29tbWl0IG1lc3NhZ2Us
IGFuZCBhbiBBc3Npc3RlZC1ieTogdGFnLiBJIHdpbGwgbm90IHJlcGx5IHRvCnRoZSBib3QgYWdh
aW4uCgpUaGFua3MsCkl0YWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
