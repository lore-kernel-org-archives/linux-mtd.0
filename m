Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6CDC04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pRXi7pROqcPiXEBZ+13jRlD6Gt6pUUopSuLjR0xmp9s=; b=yX/3M8pPQFeYWbYh5iymycgMKK
	IoSSjQvW7KiowqJx5Qi5NOTGyKRBcsmfvuCkK4Vb4GLkMH4rUlfE1fyYIBLc9Xo/uQa+i0foaqG1N
	GYyKxLdWIPpfr70ow4DMdy3KcFYerVDukS5mptVZWWcUBgJKbsNVsbYL+thvo4woDjLTttc9yrv7g
	vESYlLORg3PEEU4035VL7q7XbFTru/hc1Cdty+DvN6/eI+G2dyYNGvrQx+Qemvh8FGWBhrJVOqzG+
	5ZsihiXDo+Fl92MWdMTly1SeHgWr0WKJ2Z/nIkpGaKaisDvP55qJAKnlY3MikmSUjnE/zx7G7eCBC
	J/6c3roQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90Ac-0000000E7sG-3arg;
	Mon, 20 May 2024 10:23:06 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90Aa-0000000E7rr-2GwI
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 10:23:06 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7ebe09eb289so889249241.2
        for <linux-mtd@lists.infradead.org>; Mon, 20 May 2024 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716200581; x=1716805381; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMWsBNDp51fIz6Ut7HJ6IcQGJIYHwmBePVqcY6/wQvs=;
        b=RkR6Zy5tfUFWXjmTFQE6uuOZiqK/QzxoNT6vKygUnfuNwm9kdzsKD6V/29dVhFjQsZ
         fxPSUg67vajOtjV8zbBK15mZfyKi6u5dx5uarVqIHb8RHQDGsse1yIEXUbE7hNeyPb7l
         RkiUOxWhx9b0eO6DcYHUKqN7/eI/j7dquWW+2YnMERVettBxLYLqN/7qj6fBkmcH0gnA
         Uugj9Ye++f/fxnVoFifAHT42Xo89kdGolSZ2aUVDjUrBjcIv5sCHK0jmKdxMql+bmlPI
         FysoFs8y7deFvvItOTq52QSbrRHc/yJTlDObSr1mCp3Gyusr5R4Ll8fYv4D+oICMN9Bn
         skng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716200581; x=1716805381;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMWsBNDp51fIz6Ut7HJ6IcQGJIYHwmBePVqcY6/wQvs=;
        b=JmzFrdGg2nrmXzDDTIZevdsbqrpcWNffA5E2gIbyPzc0SnpZg4+e8uBUGqIBMFB3qz
         A8YEHdJfCbbj9l+sA9+1huKu3BwGaF5Uxq5ggkrSOZy7vhFMnZNFABGLExxjADTKUWsD
         7H05SEcv+8zmpXQAzaNingMwtnu5njkrj2zXwJLPJkOqmOQVHlUmua4shVa7dOqz9/ok
         l1Uo22vnGmKlkvUx71WqAkOcgBjKQMMIVd65rJ30qOpBxbwUQzEeXTD2T6OnQepcMRHK
         Hku8XB6chveWl7vWuGhE/vk0LIiwYmcDGiCuhbog9/xhz5hcgGS70R27dghQbAGKqg4/
         +TZw==
X-Gm-Message-State: AOJu0YwW/YS/F5JM2bcTa3r+g3+3lYZ3q09XuWBLSXybSepoix3aQ/8B
	V0SqjA673DDzwhgRF/JQ8Y/5lIjdJR5urgVAYiNfcO6JjxdzZozTWwl2rYzvwwE0sNl9JGBe68m
	Ww6pEiHBM5KmULrJsCtFwrMcL4i/vmXL1
X-Google-Smtp-Source: AGHT+IERw3D0+fzUOu1Abg+T+vugUR8Ro++MqeOUl+ePp/0W1vPiXqmbX3HuhCDUXt16q3kLmGtsbEHQSWWyxrR1BVw=
X-Received: by 2002:a05:6102:14a2:b0:47e:eeaa:90af with SMTP id
 ada2fe7eead31-48077eb6456mr35168898137.34.1716200581615; Mon, 20 May 2024
 03:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhN2pxa5KPpxiCBZMEGTgqaNddB6DZeB17tanp2gQgX1w@mail.gmail.com>
In-Reply-To: <CAOuPNLhN2pxa5KPpxiCBZMEGTgqaNddB6DZeB17tanp2gQgX1w@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 20 May 2024 15:52:49 +0530
Message-ID: <CAOuPNLjccNaLVAMWZ4p9U5zFe7FMwJa=3StPMTFDRngo2yRb-w@mail.gmail.com>
Subject: Re: How to detect if ubi volume is empty
To: linux-mtd <linux-mtd@lists.infradead.org>, linux-fsdevel@kvack.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_032304_639697_20481E37 
X-CRM114-Status: UNSURE (   9.18  )
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

In Linux Kernel 5.15 is there a way to detect in runtime, if UBI
volume (squashfs based, ubiblock, dynamic) is empty or not ?

Based on this we need to make some decisions at runtime.

Currently, we are using a crude way to detect volume empty by reading
the first 1K block using the "dd" command and checking if the contents
are all FF.

Is this good enough, or is there some other better way ?

Thanks.
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
