Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjcNE-0002lc-Cg
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 01:51:13 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 9ED452034B
 for <linux-mtd@lists.infradead.org>; Fri,  3 Mar 2017 01:50:49 +0000 (UTC)
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
 [209.85.220.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A77020376
 for <linux-mtd@lists.infradead.org>; Fri,  3 Mar 2017 01:50:46 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id h9so265954qke.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 Mar 2017 17:50:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170302210351.1f740ffc@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-4-git-send-email-albeu@free.fr>
 <20170302210351.1f740ffc@bbrezillon>
From: Moritz Fischer <mdf@kernel.org>
Date: Thu, 2 Mar 2017 17:50:45 -0800
Message-ID: <CAAtXAHdbhVe1jOj_v8+DbNp3cbL-tfWiWdteP6Vr5uvePCJR9w@mail.gmail.com>
Subject: Re: [PATCH 3/3] nvmem: core: Allow allocating several anonymous nvmem
 devices
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alban <albeu@free.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 2, 2017 at 12:03 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu,  2 Mar 2017 20:50:23 +0100
> Alban <albeu@free.fr> wrote:
>
>> Currently the nvmem core expect the config to provide a name and ID
>> that are then used to create the device name. When no device name is
>> given 'nvmem' is used. However if there is several such anonymous
>> devices they all get named 'nvmem0', which doesn't work.
>>
>> To fix this problem use the ID from the config only when the config
>> also provides a name. When no name is provided take the uinque ID of
>> the nvmem device instead.
>>
>> Signed-off-by: Alban <albeu@free.fr>
>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Reviewed-by: Moritz Fischer <mdf@kernel.org>

Thanks,
Moritz
