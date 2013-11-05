Message-ID: <52786742.1080509@asianux.com>
Date: Tue, 05 Nov 2013 11:34:26 +0800
From: Chen Gang <gang.chen@asianux.com>
MIME-Version: 1.0
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH trivial] include: uapi: standard all files' macro prefix
 and suffix, excluding "linux/" sub-directory
References: <51FB6216.6010008@asianux.com>
 <11907.1383602624@warthog.procyon.org.uk>
In-Reply-To: <11907.1383602624@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: xen-devel@lists.xensource.com, jeremy@goop.org, airlied@linux.ie,
 daniel.vetter@ffwll.ch, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, perex@perex.cz, thierry.reding@gmail.com,
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
 'Jiri Kosina' <trivial@kernel.org>, dedekind1@gmail.com,
 sw0312.kim@samsung.com,
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

On 11/05/2013 06:03 AM, David Howells wrote:
> Chen Gang <gang.chen@asianux.com> wrote:
> 
>> For "include/uapi/*", excluding "linux/" sub-directory, let all files'
>> macro prefix match the standard format, and give related stand comments
>> for their macro suffix.
>>
>> The related standard format is:
>>
>>   "_SUBDIRNAME_SUBDIRNAME[_SUBDIRNAME]_FILENAME" (1st _SUBDIRNAME is _UAPI), and use '_' instead of '.' and '-'.
> 
> I strongly recommend _against_ this without very careful consideration.

All first-send interface related patches are not for applying, they are
only for discussing.


> Userspace sometimes depends on the name in the guard macro:-/
> 

"the guard macro" is only for prevent itself from being included by
multiple times (an id used by itself -- like a handle), it is not an id
to let other files know about it (it is not a normal using way).

If we really want to check "a file id", normally we will check some
macros which already defined in this header file (or in some scripts,
check file path) instead of checking "its file id"

Using the standard format can be sure of file id is always unique in the
future, and it also can let our interface (Linux's address) more cleaner
and beautiful.


Hmm.. do you mean as an interface, if really have unusual(incorrect)
using ways, we have to bear and compatible with them -- although the
interface never says "it will not be changed in the future".


Thanks.
-- 
Chen Gang
