Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTONi-0004Cy-HZ
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 01:45:43 +0000
Received: by bkat2 with SMTP id t2so2443124bka.36
 for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 17:45:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322034324.24797.230.camel@sauron.fi.intel.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
 <1321790131.15493.85.camel@shinybook.infradead.org>
 <1321794503.2170.3.camel@koala>
 <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
 <1321997940.2222.19.camel@koala>
 <CAMjpGUdxGfo7dfSNhzQUHg3QGkKW7rQewiFhDjGyJ0TjjQkdkA@mail.gmail.com>
 <1322034324.24797.230.camel@sauron.fi.intel.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 23 Nov 2011 20:45:18 -0500
Message-ID: <CAMjpGUfkc7JftBx5uMBDy7YAn2z4yCh6eVYibEZ9pQayphFcsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 23, 2011 at 02:45, Artem Bityutskiy wrote:
> On Tue, 2011-11-22 at 17:21 -0500, Mike Frysinger wrote:
>> On Tue, Nov 22, 2011 at 16:38, Artem Bityutskiy wrote:
>> > On Sun, 2011-11-20 at 23:22 -0500, Mike Frysinger wrote:
>> >> On Sun, Nov 20, 2011 at 08:08, Artem Bityutskiy wrote:
>> >> > usage() {
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0cat <<EOF
>> >> > Usage: ${0##*/} <new_ver> <outdir>
>> >> >
>> >> > <new_ver> =C2=A0- mtd utils version to create in X.Y.Z format
>> >> > <outdir> =C2=A0 - the output directory where to store the tarball w=
ith the
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpg signature
>> >> > EOF
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0
>> >> > }
>> >>
>> >> i'd have outdir be optional and default to $PWD
>> >
>> > Yeah, but this would require me to add options handling using getopt,
>> > because optional parameters have to have an option. I just do not feel
>> > it is necessary right now. This can be done at any point if someone
>> > needs.
>>
>> i don't think so
>>
>> case $# in
>> =C2=A0 0) usage ;;
>> =C2=A0 1|2) ;;
>> =C2=A0 *) fatal "Insufficient or too many argumetns" ;;
>> esac
>>
>> new_ver=3D"$1"; shift
>> outdir=3D"${1:-.}"; shift
>
> I did not mean it is technincally impossible, I meant that it is just
> normal Unix rule which I want to stick with, at least in simple cases:
>
> 1. Non-mandatory arguments come with options like -x <blah>
> 2. Mandatory arguments come come without options.
>
> utility < -x blah and other optional stuff> <arg1> <other mandatory
> args>

sure, but we're not taking about options here, we're talking about
required arguments:
./make-release.sh <version> [output_dir]

if we were to make it into:
./make-release.sh [-o output_dir] <version>

then i'd understand the `getopt` desire
-mike
