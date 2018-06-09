Date: Sat, 9 Jun 2018 08:10:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Hossein Radhasani <radhassani@birjand.ac.ir>
Cc: boris.brezillon@free-electrons.com,
 linux-mtd-request@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: NAND memory help request
Message-ID: <20180609081033.6ac616a6@bbrezillon>
In-Reply-To: <325332937-5984@post.birjand.ac.ir>
References: <325332937-5984@post.birjand.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, 9 Jun 2018 07:55:57 +0430
Hossein Radhasani <radhassani@birjand.ac.ir> wrote:

> Hi,
> 
> My research subject is NAND non-volatile memory and need some help.
> I have beaglebone board with emmc memory and orangepi with nand memory.
> how to write(program) specific nand memory page of above development board.

You should have a look at chapters "Block filesystems" and "Flash
storage and filesystems" of these slides [1].

Regards,

Boris

[1]https://bootlin.com/doc/training/embedded-linux/embedded-linux-slides.pdf
