Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pt0HQ-0005kL-Sn
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 16:12:33 +0000
Received: by wyf23 with SMTP id 23so1824245wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 08:12:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1298637524.2798.103.camel@localhost>
References: <AANLkTimN5eBifpcyfJYo9s51U+kEi1ZemFnOm7p2rcxQ@mail.gmail.com>
	<1298637524.2798.103.camel@localhost>
Date: Fri, 25 Feb 2011 10:12:30 -0600
Message-ID: <AANLkTimvqdu1k3ZL4rqC-DBiMkNmytBXZ1YWXNE0Gs6F@mail.gmail.com>
Subject: Re: Slab memory leak in JFFS2 filesystems
From: Johns Daniel <johns.daniel@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 25, 2011 at 6:38 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Thu, 2011-02-24 at 18:41 -0600, Johns Daniel wrote:
>> I have discovered a kernel memory leak associated with JFFS2
>> filesystems. I have verified the leak in kernels 2.6.28 and 2.6.36 on
>> a Freescale PowerPC board using this script:
>>
>> while :; do FN=3D$(mktemp /jffs2fs/TMP.XXXXXXXX); \
>> =C2=A0 =C2=A0cat /proc/slabinfo |grep "dentry\|size-64 "; sleep 1; /bin/=
rm $FN; done
>
> Please, check whether they go away after:
>
> echo 3 > /proc/sys/vm/drop_caches
>
> See Documentation/sysctl/vm.txt for more information about what this
> means.

Thanks for that suggestion, Artem! Here is what I tried:

# grep "dentry\|size-64 " /proc/slabinfo
dentry              1398   1410    128   30    1 : tunables  120   60
  0 : slabdata     47     47      0
size-64             1235   1239     64   59    1 : tunables  120   60
  0 : slabdata     21     21      0
# echo 3 > /proc/sys/vm/drop_caches
# grep "dentry\|size-64 " /proc/slabinfo
dentry               332    780    128   30    1 : tunables  120   60
  0 : slabdata     26     26      0
size-64             1213   1239     64   59    1 : tunables  120   60
  0 : slabdata     21     21      0

Then I ran this script for 10 minutes:
# while :; do FN=3D$(mktemp /jffs2fs/TMP.XXXXXXXX); \
     grep "dentry\|size-64 " /proc/slabinfo; sleep 1; /bin/rm $FN; done

I wasn't sure whether the effect of the "drop_caches" command was
"persistent". So I ran the command once more:
# echo 3 > /proc/sys/vm/drop_caches

About 20 minutes after I stopped the test script, here is the status:
# grep "dentry\|size-64 " /proc/slabinfo
dentry               387    780    128   30    1 : tunables  120   60
  0 : slabdata     26     26      0
size-64             1865   1888     64   59    1 : tunables  120   60
  0 : slabdata     32     32      0

Clearly, there is some growth in the slabs that cannot be explained. I
will also give you two counterpoints:

1.) If I run this similar test script on the same system, the slab
memory does not grow at all (regardless of the drop_caches setting):

while :; do FN=3D$(touch /jffs2fs/TMP.XXXXXXXX); \
   grep "dentry\|size-64 " /proc/slabinfo; sleep 1; /bin/rm /data/TMP.*; do=
ne

2.) This bug brought one of our production systems in the field to its
knee in less than 3 months. If the memory was reclaimable, I don't
think this slab memory growth would have exhausted available free
memory in the system to the point that other processes were unable to
allocate memory.

Any help would be appreciated!

-- Johns

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
