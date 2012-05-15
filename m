Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUM8q-0006bs-Hj
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 18:06:37 +0000
Received: by pbbrq13 with SMTP id rq13so8863326pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 11:06:35 -0700 (PDT)
MIME-Version: 1.0
Sender: dsdrake@gmail.com
In-Reply-To: <1337094404.4170.72.camel@shinybook.infradead.org>
References: <20120410212235.951079D401E@zog.reactivated.net>
 <1337094404.4170.72.camel@shinybook.infradead.org>
Date: Tue, 15 May 2012 12:06:34 -0600
Message-ID: <CAMLZHHQsbnPK=rLynao6k1euV0HFP6_gXAkJ_8WEOs8uo7zhbw@mail.gmail.com>
Subject: Re: [PATCH] JFFS2: Add parameter to reserve disk space for root
From: Daniel Drake <dsd@laptop.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dilinger@queued.net, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2012 at 9:06 AM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Tue, 2012-04-10 at 22:22 +0100, Daniel Drake wrote:
>>
>> + =A0 =A0 =A0 /* Always allow root */
>> + =A0 =A0 =A0 if (current_fsuid() =3D=3D 0 || current_fsgid() =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
>
> I've changed that to if (capable(CAP_SYS_RESOURCE)) rather than having a
> hard-coded check for the root user, which is usually the wrong thing to
> do. Please test.

Yes, this works fine.

Thanks!
Daniel
