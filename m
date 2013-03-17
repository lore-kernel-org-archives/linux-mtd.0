Date: Sun, 17 Mar 2013 21:58:05 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/4] mtd: merge mtdchar module with mtdcore
Message-ID: <20130317215805.3246b0b5.shmulik.ladkani@gmail.com>
In-Reply-To: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-cris-kernel@axis.com,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mikael Starvik <starvik@axis.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 14 Mar 2013 13:27:40 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Indeed, mtdchar is a module that allows user-space making use of MTD devices
> via /dev/mtd* character devices. If users do not enable it, they simply cannot
> use MTD devices at all. The cannot read or write the flash contents. Is it a

s/ The cannot/ They cannot/

What about the defconfig files?

Thanks,
Shmulik
