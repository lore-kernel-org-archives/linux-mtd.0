Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FiUWz-0007YH-TS
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 06:54:38 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1497727uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 May 2006 03:54:27 -0700 (PDT)
Message-ID: <625fc13d0605230354q2448d66cn71cdd8c2428e9c64@mail.gmail.com>
Date: Tue, 23 May 2006 05:54:27 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Davide CASCONE" <davide.cascone@st.com>
In-Reply-To: <004a01c67e54$228ee2e0$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <004a01c67e54$228ee2e0$253682a4@nap.st.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Flash unlock
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/23/06, Davide CASCONE <davide.cascone@st.com> wrote:
> Does JFFS2 automatically unlock the flash memory (on which the file syste=
m is mounted) before to issue a write/erase command? If no, is it correct t=
o unlock the flash sectors related to file system during the platform initi=
alization?
>

No, it doesn't.  http://linux-mtd.infradead.org/faq/general.html

josh
