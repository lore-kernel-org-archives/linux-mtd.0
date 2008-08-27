Date: Wed, 27 Aug 2008 17:25:34 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
Message-ID: <20080827152534.GB1371@logfs.org>
References: <1219817017.18027.149.camel@sauron>
	<000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<20080827093920.1bdb44c2@lxorguk.ukuu.org.uk>
	<1219827692.7107.170.camel@pmac.infradead.org>
	<20080827143416.GA1371@logfs.org>
	<1219848463.18027.166.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1219848463.18027.166.camel@sauron>
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, Tim Anderson <tanderson@mvista.com>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 August 2008 17:47:43 +0300, Artem Bityutskiy wrote:
> 
> The plus of sysfs I see is that I can add more files to expose more
> information in sysfs, while I can not change MEMGETINFO ioctl. E.g., I
> need to expose sub-page size to user-space, and I cannot do this with
> MEMGETINFO.

sysfs makes adding new attributes easier, yes.  But once added you
cannot remove the attribute again - ever.  Which means that either way
you need to tread carefully and think twice before making a rash
decision.

> > So what was the reason again why mtd needs two userspace interfaces
> > instead of just one?
> 
> I would like to make udev creating MTD devices, instead of creating them
> by hands. Adding MTD to LDM would anyway introduce corresponding sysfs
> files, right? This means we would have one more interface anyway.

Could be useful, I don't mind you sending a patch.  However, does this
means that MEMGETINFO64 or some other ioctl should not be done?  Should
flash_erase open, read and close 8 seperate files instead of doing a
single ioctl?  And should our support for large devices wait for the
sysfs support that has been talked about and not done for about two
years already?

Call me a sceptic.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories
