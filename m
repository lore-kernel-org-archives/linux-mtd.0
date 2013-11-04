From: David Howells <dhowells@redhat.com>
In-Reply-To: <51FB6216.6010008@asianux.com>
References: <51FB6216.6010008@asianux.com>
To: Chen Gang <gang.chen@asianux.com>, "'Jiri Kosina'" <trivial@kernel.org>
Subject: Re: [PATCH trivial] include: uapi: standard all files' macro prefix
 and suffix, excluding "linux/" sub-directory
Date: Mon, 04 Nov 2013 22:03:44 +0000
Message-ID: <11907.1383602624@warthog.procyon.org.uk>
Cc: xen-devel@lists.xensource.com, jeremy@goop.org, airlied@linux.ie,
 daniel.vetter@ffwll.ch, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, perex@perex.cz,
 "dhowells@redhat.com" <dhowells@redhat.com>, thierry.reding@gmail.com,
 linux-mtd@lists.infradead.org, sean.hefty@intel.com,
 virtualization@lists.linux-foundation.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "kgene.kim@samsung.com" <kgene.kim@samsung.com>, tbergstrom@nvidia.com,
 jy0922.shim@samsung.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 roland@purestorage.com, Takashi Iwai <tiwai@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, mtk.manpages@gmail.com,
 fcoe-devel@open-fcoe.org, Paul McKenney <paulmck@linux.vnet.ibm.com>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, Arnd Bergmann <arnd@arndb.de>,
 swarren@wwwdotorg.org, intel-gfx@lists.freedesktop.org, inki.dae@samsung.com,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-tegra@vger.kernel.org, davej@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, robert.w.love@intel.com,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dedekind1@gmail.com, sw0312.kim@samsung.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 JBottomley@parallels.com,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
 David Miller <davem@davemloft.net>, shanim@mellanox.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chen Gang <gang.chen@asianux.com> wrote:

> For "include/uapi/*", excluding "linux/" sub-directory, let all files'
> macro prefix match the standard format, and give related stand comments
> for their macro suffix.
> 
> The related standard format is:
> 
>   "_SUBDIRNAME_SUBDIRNAME[_SUBDIRNAME]_FILENAME" (1st _SUBDIRNAME is _UAPI), and use '_' instead of '.' and '-'.

I strongly recommend _against_ this without very careful consideration.
Userspace sometimes depends on the name in the guard macro:-/

David
