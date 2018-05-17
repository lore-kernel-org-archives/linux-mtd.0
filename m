Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJM64-0001tl-4U
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 16:49:44 +0000
Received: by mail-wm0-x22d.google.com with SMTP id l1-v6so10342995wmb.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2018 09:49:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
References: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 17 May 2018 18:49:29 +0200
Message-ID: <CAFLxGvxSNr1MQoa3Zidg=+fhCY1qkeGQ_fhpy1X0eS51xA=4Rw@mail.gmail.com>
Subject: Re: Increased frequency of fastmap failure due to CRC mismatch
To: Ronak Desai <ronak.desai@rockwellcollins.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 17, 2018 at 5:47 PM, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:
> We are at kernel 4.1.8.

Woah, this kernel is very old, did you backport _all_ ubi/fastmap fixes?

-- 
Thanks,
//richard
