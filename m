Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYNKO-0004G2-Oe
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 19:38:53 +0000
Received: by bkcje16 with SMTP id je16so1068213bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 11:38:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323173269-19931-6-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
Date: Wed, 7 Dec 2011 11:38:50 -0800
Message-ID: <CAN8TOE8vJfTzxT2Mz4=r45w==rg2dOneGvYTNZNi_tEZD6CrPw@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 06/13] nand-data: fix name for Samsung
 "K9XDG08U5D"
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
> Change Samsung "K9XDG08U5D" to "K9MDG08U5D".

According to my data sheet, all the following are available:

K9LBG08U0D
K9HCG08U1D
K9MDG08U5D
K9PDGZ8U5D
K9PDG08U5D

While they use "K9XDG08U5D" to cover the last 3 chips with the same ID
under the "Read ID" section, with `X' as a wildcard character. So it
should match K9MDG08U5D, K9PDG08U5D, and K9PDGZ8U5D.

Any of the following covers the chips close enough (see other message
regarding wildcards):

K9xDG08U5D
K9xDGx8U5D
K9-DG08U5D
K9-DG-8U5D
