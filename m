From: jburch@vincisystems.com (John Burch)
Date: Mon, 17 Mar 2003 11:09:29 -0500
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047916461.11517.85.camel@tubarao>
Message-ID: <000901c2ec9f$98b48dc0$1200a8c0@JOHNB>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


> -----Original Message-----
> From: Thayne Harbaugh [mailto:tharbaugh at lnxi.com]=20
> Sent: Monday, March 17, 2003 10:54 AM
> To: Steve Wahl
> Cc: John Burch; linux-mtd at lists.infradead.org
> Subject: Re: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy=20
> Queen 5 warning)
>=20
<snip>
>=20
>=20
> Big question: how is it know if status bits are being read or=20
> the real data that was written to an address?  I have read=20
> many data sheets and I don't recall any of them discussing=20
> this concern.

I believe that if DQ6 is not toggling, then you're reading
actual data.  If DQ6 is toggling and DQ5=3D0, then you're reading
Status and the device is still busy.  If DQ6 is toggling and DQ5=3D1,
You're still reading status and DQ6 must be checked again.
If toggling, operation timed out, you're still reading status, and
reset command must be issued. If not toggling, operation completed,
and you're reading data.  (At least this is how AMD describes it.)

John

<snip>
