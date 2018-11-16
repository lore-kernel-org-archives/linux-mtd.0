Received: from martinlund.org ([173.255.130.145]
 helo=slmp-550-86.slc.westdc.net)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNcxd-00087h-7X
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 12:10:58 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46086)
 by slmp-550-86.slc.westdc.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <martin.lund@keep-it-simple.com>) id 1gNcxS-00Dl7W-BA
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 05:10:46 -0700
Received: by mail-ot1-f47.google.com with SMTP id w25so20374971otm.13
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2018 04:10:46 -0800 (PST)
MIME-Version: 1.0
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CAB7pii3kx75ajF=8TsU7mWrmrzoHLiy7uAb+PirGw04BH65bZg@mail.gmail.com>
In-Reply-To: <CAB7pii3kx75ajF=8TsU7mWrmrzoHLiy7uAb+PirGw04BH65bZg@mail.gmail.com>
From: Martin Lund <martin.lund@keep-it-simple.com>
Date: Fri, 16 Nov 2018 13:10:34 +0100
Message-ID: <CAB7pii3LdMhaUhR1O8d5-79JYNnoO2c5cjnSC3qkhRH=hg+opw@mail.gmail.com>
Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
To: naga.sureshkumar.relli@xilinx.com
Cc: Martin Lund <martin.lund@keep-it-simple.com>, boris.brezillon@bootlin.com,
 miquel.raynal@bootlin.com, richard@nod.at,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, michals@xilinx.com,
 naga sureshkumar <nagasuresh12@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 16, 2018 at 12:50 PM Martin Lund
<martin.lund@keep-it-simple.com> wrote:
> Compared with the example you will notice that "clock-name" should be
> "clock-names". reg was missing a "0x0".

Also, "sys" should be "clk_sys" and "flash" should be "clk_flash".
