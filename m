Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAF44-0004eD-8p
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2018 14:02:25 +0000
Received: by mail-qt1-x844.google.com with SMTP id c56-v6so5697968qtd.11
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2018 07:02:06 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20181010134317.8466-3-geert+renesas@glider.be>
References: <20181010134036.8296-1-geert+renesas@glider.be>
 <20181010134317.8466-1-geert+renesas@glider.be>
 <20181010134317.8466-3-geert+renesas@glider.be>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Oct 2018 16:02:04 +0200
Message-ID: <CAK8P3a3XuZ4nZ7FJgi=m1L7tznjue4+77wd2KYe_qGH=zaEZMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] eeprom: at25: Use spi_message_init_with_transfers()
 instead of open coding
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/10/18, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Reduce code duplication in at25_ee_read() by using the
> spi_message_init_with_transfers() helper.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Arnd Bergmann <arnd@arndb.de>
