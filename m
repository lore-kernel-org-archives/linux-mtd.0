Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpOUc-0006EW-7C
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 15:06:16 +0000
Received: by bwz3 with SMTP id 3so600600bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Apr 2009 08:06:08 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2009 20:36:07 +0530
Message-ID: <ce9ab5790904020806o649f80bck2ee44ca7adf5ac04@mail.gmail.com>
Subject: RE Problem in cloning mtd git
From: vimal singh <vimal.newwork@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 2, 2009 at 5:42 PM, Geert Uytterhoeven
<Geert.Uytterhoeven@sonycom.com> wrote:
> On Thu, 2 Apr 2009, vimal singh wrote:
>> >> $ git clone --reference linux-2.6 git://git.infradead.org/mtd-2.6.git=
 mtd-2.6
>> >> warning: templates not found /home_lbp/share/git-core/templates/
>> >> Initialized empty Git repository in /home2/vimal/mtd-2.6/.git/
>> >> fatal: Unable to look up git.infradead.org (port 9418) (Temporary
>> >> failure in name resolution)
>> >> fetch-pack from 'git://git.infradead.org/mtd-2.6.git' failed.
>> >>
>> >> Any help regarding this is welcome...
>> >
>> > Alternatively, you can add the MTD stuff as a remote to your existing
>> > repository:
>> >
>> > % cd linux-2.6
>> > % git remote add mtd git://git.infradead.org/mtd-2.6.git
>> > % git remote update
>> >
>> I tried this right now and I see this:
>> >From http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6
>> =A0 =A015f7176..833bb30 =A0master =A0 =A0 -> origin/master
>> Updating mtd
>> fatal: Unable to look up git.infradead.org (port 9418) (Temporary
>> failure in name resolution)
>
> Local DNS problem? =A0Try 18.85.46.34 instead of git.infradead.org.

Yes looks like... I still see problem:

$ git remote add mtd git://18.85.46.34/mtd-2.6.git
$ git remote update
Updating origin
Updating mtd
18.85.46.34[0: 18.85.46.34]: errno=3DConnection timed out
fatal: unable to connect a socket (Connection timed out)
error: Could not fetch mtd



---
Regards,

\/ | |\/| /-\ |_

____ =A0 __o
------ =A0 -\<,
----- =A0( )/ ( )
