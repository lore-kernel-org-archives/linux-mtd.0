Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5782C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 22:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AE122B40
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 22:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNTLXrRa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO+7y7Zo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9AE122B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wzz/d6xm9GHuGs91EuGh8dRl9YJPq3flYQWeyh3K20c=; b=WNTLXrRaG2ctNZ0O4rkCYXugf
	/RTc29TibuFUVN9UxEdpFy4XNEei6fqobIQCs6Y4KF/jTyCPcaIf8//CuWu9DtR+XMoFxPWvDGOSY
	juxYMunS04cPjozt1whGiJotfyHCio7AZUb/yb3F36BHVklckvVAL2fQ0zIwR4SKCXtCb78tLxAfD
	jN0BVEyWOFC4jS1KNaKUx8bPVwMHsywX58O/IxEMPKytBp1wGwG38TpnxQgmDvI8DucPzvXe1DSry
	d2pZMoIoEHL0uYfJRbKeGgBAQ4mEZPQc/dyioJq+zlIwO8WMw/MIKN9R4W57H/3uz7LvLJz68RgBJ
	Gg6A6cT6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2igP-0006Ea-3M; Mon, 03 Aug 2020 22:11:49 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2igL-0006DI-Tn
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 22:11:46 +0000
Received: by mail-qk1-x744.google.com with SMTP id b14so34977282qkn.4
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uF8luRBGC6gWdncfcHZ2lLN5MmAPsETtk+IqdVjFAwk=;
 b=OO+7y7Zo4t1fTSCcJirSgnVoYMU7it8zYAi8/wDo+lAAFzC5+uk7fN02sYL+VXmf1F
 12e9Wl0UYJyAhjGIXNJZFOiEc2CSIukEK8Tj7fh4f0tllWIy8N3S6cDjj+jZ3jDPGqup
 IyfUBAIyrnj1uWIblUBiFNjTZD96LTF2wucPEtPQd2YG5SxXJD5Vs1CyASZUrGSYiFua
 ylU1R81O+lV/kcEW0DBYf6UVatpklyT6Zzon6JpiNYhzvOzn3O5BkB6/WferNlnz/x8x
 ON0FLm2xACSSv3e3QIqCHEi7w+zAO1cOSwbKfwNjM4kofd6Jf68jcMYQFdc1MqtKLMiW
 /IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uF8luRBGC6gWdncfcHZ2lLN5MmAPsETtk+IqdVjFAwk=;
 b=ioY0+J6dANDW/YQFYNdLwvoilMBABma4Hmeqw5BidImMndypvFZzpaNmqDwhGIQt6x
 1lXqOBcqYQMau5V2kvvirN2fwl7YzRxlCx1c9P0sZGCwMTnLKfQMb+eteuazGrrxkb3t
 WEAD014jtxLRLddCJe2dO8Ro4xSVGjXPot+KatLKn06xETByqZNUqvNhg+SwDgYsw5xz
 0jWGXGuPoUg7VrXWv67zx4cuBYyrzJoY/chJU7IE/eUbzJw2rhz7vbpDciyF3kKzLwYF
 UFpAchdyoBMKe7Pzn0xn9eicC2x/V6QU6NWTgNlcn8v9EarBryPGQxpMz/obdy8r3yZG
 PiWw==
X-Gm-Message-State: AOAM532GEKVzPVmDOJY+mBabRLzCWPEAjlw54j2nLF1YrWzdvlgfH/fA
 9sBBS1hLzX+rZXekCzr7gyttNc+mCsEC9H8c2Y4=
X-Google-Smtp-Source: ABdhPJyWx9iobvP+SxOeDebHgAj8paDE6Bi7DhO525PPiN6DAvHlq5H5qgpz/RIOhikDRhKoPrg0vjGD6mgngNknOjU=
X-Received: by 2002:a37:a44:: with SMTP id 65mr7205489qkk.370.1596492703307;
 Mon, 03 Aug 2020 15:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
In-Reply-To: <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 4 Aug 2020 00:11:31 +0200
Message-ID: <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_181145_978188_8FBE6408 
X-CRM114-Status: GOOD (  14.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 4:01 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
> > Hmm, I see the problem but I fear this patch does not cure the race completely.
> > It just lowers the chance to hit it.
> > What if KTHREAD_SHOULD_STOP is set right after you checked for it?
>
> The patch can handle this case. ubi_thread will exit at
> kthread_should_stop() in next iteration.

How can it reach the next iteration?
Maybe I didn't fully get your explanation.

As far as I understand the problem correctly, the following happens:
1. ubi_thread is running and the program counter is somewhere between
"if (kthread_should_stop())"
and schedule()
2. While detaching kthread_stop() is called
3. Since the program counter in the thread is right before schedule(),
it does not check KTHREAD_SHOULD_STOP
and blindly calls into schedule()
4. The thread goes to sleep and nothing wakes it anymore -> endless wait.

Is this correct so far?

Your solution is putting another check for KTHREAD_SHOULD_STOP before
schedule().
I argue that this will just reduce the chance to hit the race window
because it can still happen
that kthread_stop() is being called right after the second check and
again before schedule().
Then we end up with the same situation.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
