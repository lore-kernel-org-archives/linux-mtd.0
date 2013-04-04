Message-ID: <1365089017.626.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: merge mtdchar module with mtdcore
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 04 Apr 2013 18:23:37 +0300
In-Reply-To: <20130317215805.3246b0b5.shmulik.ladkani@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <20130317215805.3246b0b5.shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-cris-kernel@axis.com,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mikael Starvik <starvik@axis.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-03-17 at 21:58 +0200, Shmulik Ladkani wrote:
> On Thu, 14 Mar 2013 13:27:40 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Indeed, mtdchar is a module that allows user-space making use of MTD devices
> > via /dev/mtd* character devices. If users do not enable it, they simply cannot
> > use MTD devices at all. The cannot read or write the flash contents. Is it a
> 
> s/ The cannot/ They cannot/

Fixed.

> What about the defconfig files?

There are too many of them. I do not want to update them because it is
not necessary and the non-existing symbol will just be ignored by
Kbuild. People who support their defconfigs will eventually update them
eventually.

-- 
Best Regards,
Artem Bityutskiy
