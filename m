Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adwX9-0005OU-6l
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 09:05:27 +0000
Message-ID: <1457600704.22708.9.camel@gmail.com>
Subject: Re: Is ubiattach alone somehow damaging a partition?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: john smith <wempwer@gmail.com>, Richard Weinberger
 <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 10 Mar 2016 11:05:04 +0200
In-Reply-To: <CAKmQUfZT+S5--mQntpUrZWR4gk4YcoXChN5254hixYtrT5JFYw@mail.gmail.com>
References: <CAKmQUfY0tU1H_e0kYk5r4gREL55R8uHtgXrbEMuS4pSJ6cf94g@mail.gmail.com>
 <CAFLxGvzL7ujU6+OHnYGbk3pWOxSjw_Voo2=7iOYfvb+cbGvTEQ@mail.gmail.com>
 <CAKmQUfZT+S5--mQntpUrZWR4gk4YcoXChN5254hixYtrT5JFYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-03-09 at 21:52 +0100, john smith wrote:
> On 3/9/16, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> > 
> > Are both mtd1 and mtd2 supposed to carry UBI?
> > I'm not rally sure what you are trying to do...
> Hmm... probably not as kernel booting command does not contain
> anything similar to this:
> 
> root=ubi:rootfs rootfstype=ubifs ubi.mtd=flash1.rootfs0
> 
> However, I just thought that I can use ubiattach to be able to mount
> any given mtd device.  I was looking for a way to get access to a
> currently not used mtd device.  If ubiattach is suitable for this,
> then what may be?

Yeah, as Richard said, this is a bit vague description.

If you know what LVM is, what you are saying is something like:

"I just thought that I can use vgimport to be able to mount any block
device. I  was looking for a way to get access to a currently not used
block devices. If vgimport is suitable for this, then what may be?"

Indeed, try to express what you want to achieve, and them may be it
becomes clearer to us.

Artem.
