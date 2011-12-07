Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYMeR-0000xt-18
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 18:55:31 +0000
Received: by fabs1 with SMTP id s1so344090fab.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 10:55:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323173269-19931-3-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
Date: Wed, 7 Dec 2011 10:55:28 -0800
Message-ID: <CAN8TOE_cjJwscyAhX82WjkBack7LHhU53BcKAVMk6p5m_c9bTg@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 03/13] nand-data: Samsung devices: fix ID Length
 = "5?"
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

On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
> Change the ID Length for Samsung devices K9F8G08B0M, K9F8G08U0M, K9F8G08U1M,
> from "5?" to "5", as documented in the datasheets and verified on a K9F8G08B0M
> device.

Acked-by: Brian Norris <computersforpeace@gmail.com>

FYI, feel free to remove question marks from any items that you find
good reason to believe they are correct. I placed question marks when
I couldn't be 100% sure; for example, the data sheet wasn't explicit
in saying the part is SLC.
