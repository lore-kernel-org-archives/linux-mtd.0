Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYNXe-00069c-RS
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 19:52:35 +0000
Received: by bkcje16 with SMTP id je16so1087502bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 11:52:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323173269-19931-8-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <1323173269-19931-7-git-send-email-angus.clark@st.com>
 <1323173269-19931-8-git-send-email-angus.clark@st.com>
Date: Wed, 7 Dec 2011 11:52:32 -0800
Message-ID: <CAN8TOE9j=R=Wcr7VWR5hjM+i2RmB-THak+s7eDGqTvdr5SZWxQ@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 08/13] nand-data: fix ID Length for Hynix
 "HY27US{08, 16}12(1/2)B" devices
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
> Fix ID Length for Hynix "HY27US{08,16}12(1/2)B" devices, from '4' to '2',
> according to datasheet I have, and READID listed in the table.

My typo again. Thanks for the catch.

> -"Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16=
","N/A","1st or 2nd page (3rd word in OOB =3D non FFh)",TRUE,FALSE,FALSE,FA=
LSE,TRUE,"1-bit/528-byte",1,4,"ID Table",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,T=
RUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 (""word 3"") for=
 BBM"
> +"Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16=
","N/A","1st or 2nd page (3rd word in OOB =3D non FFh)",TRUE,FALSE,FALSE,FA=
LSE,TRUE,"1-bit/528-byte",1,2,"ID Table",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,T=
RUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 ('word 3') for B=
BM"

Note that you're changing the note from:

This is the ONLY x16 chip that uses byte 6 ("word 3") for BBM

to

This is the ONLY x16 chip that uses byte 6 ('word 3') for BBM

I don't mind. Just FYI.

Acked-by: Brian Norris <computersforpeace@gmail.com>
