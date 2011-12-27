Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfTg9-0005JH-Fg
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 09:50:42 +0000
Received: by eaai13 with SMTP id i13so6164391eaa.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 01:50:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324979273.1165.69.camel@sauron.fi.intel.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
 <1324663880-22477-4-git-send-email-dedekind1@gmail.com>
 <CAMjpGUeh+V0Oe8RgDjKM+WyukWJcRn4X0kh3=CPVohGAycb+qA@mail.gmail.com>
 <1324978636.1165.66.camel@sauron.fi.intel.com>
 <1324979273.1165.69.camel@sauron.fi.intel.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 27 Dec 2011 04:50:18 -0500
Message-ID: <CAMjpGUdyvFzRKQ_3RHB_vNEMOJSFy76cLTKBtoFLB-52WxufHQ@mail.gmail.com>
Subject: Re: [PATCH 03/28] mtd: introduce mtd_erase interface
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 27, 2011 at 04:47, Artem Bityutskiy <dedekind1@gmail.com> wrote=
:
> On Tue, 2011-12-27 at 11:37 +0200, Artem Bityutskiy wrote:
>> On Tue, 2011-12-27 at 04:22 -0500, Mike Frysinger wrote:
>> > On Fri, Dec 23, 2011 at 13:10, Artem Bityutskiy wrote:
>> > > =C2=A0static inline struct mtd_info *dev_to_mtd(struct device *dev)
>> > > =C2=A0{
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev ? dev_get_drvdata(dev) : NULL;
>> >
>> > on an unrelated note, this NULL check is unnecessary. =C2=A0the core f=
unc
>> > already takes care of checking the pointer.
>>
>> Sure, I can cook a separate patch for this, thanks!
>
> Which will probably kill entire 'dev_to_mtd()', but not for
> this merge window.

sounds good.  my mobo died, so it's hard for me to post patches atm :/.
-mike
