Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlrTo-0000lE-AH
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 00:28:21 +0000
Received: by wibhq15 with SMTP id hq15so1042015wib.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 16:28:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1326198741-12566-3-git-send-email-angus.clark@st.com>
References: <1326198741-12566-1-git-send-email-angus.clark@st.com>
 <1326198741-12566-3-git-send-email-angus.clark@st.com>
Date: Fri, 13 Jan 2012 16:28:17 -0800
Message-ID: <CAN8TOE8oGx4QgoU9RznhwMag6_hds=3mXe6jUZv0FE13yfab9Q@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 3/3] nand-data: add devices
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 10, 2012 at 4:32 AM, Angus CLARK <angus.clark@st.com> wrote:
> Add some devices to the table.
>
> Signed-off-by: Angus Clark <angus.clark@st.com>

Hynix HY27UF161G2A is x16, so it should have "word" not "byte", i.e.:
  "1st or 2nd page (1st word in OOB = non FFh)"
vs.
  "1st or 2nd page (1st byte in OOB = non FFh)"
Just a nitpick, but similar for a few other x16 chips (K9F2G16U0M,
TC58NVG1S8BFT00)

Also, some of your new parts don't have a value for "Full Support." If
the other information is correct, shouldn't they all be TRUE? (I know
there are some holes elsewhere, but there's usually a reason, I
think).

BTW, I wasn't able to find data sheets for many of these. Perhaps they
are just older generations.

Thanks,
Brian
