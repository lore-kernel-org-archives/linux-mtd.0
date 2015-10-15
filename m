MIME-Version: 1.0
In-Reply-To: <1444929443-25537-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1444929443-25537-1-git-send-email-boris.brezillon@free-electrons.com>
 <1444929443-25537-2-git-send-email-boris.brezillon@free-electrons.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 16 Oct 2015 09:32:38 +1100
Message-ID: <CAGRGNgWcCLEX=CB6_OJrK9_n3=78WN1jUb+t4iOQca6_HnFoLg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/3] mtd: nand: add NAND_NEED_SCRAMBLING
 option flag
To: boris.brezillon@free-electrons.com
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Hans de Goede <hdegoede@redhat.com>,
 "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Oct 16, 2015 at 4:17 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Some MLC NANDs are sensible to repeated patterns and require data to be

Do you mean "sensitive" instead of "sensible"?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
