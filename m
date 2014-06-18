From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v2 0/3] mtd: Add sysfs entries and account BBT blocks
 properly
Date: Wed, 18 Jun 2014 05:22:00 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF5D56@DBDE04.ent.ti.com>
References: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel


>From: Ezequiel Garcia
>
>Here's a new round of the patchset to add sysfs entries for the ECC stats
>struct fields. See the discussion around previous version for context:
>
>http://lists.infradead.org/pipermail/linux-mtd/2014-March/052804.html
>
>Changes from v1:
>
>  * As agreed I've added a sysfs file per field to replace the ecc_stats
>    sysfs file. The current proposal follows the "one file per value" sysf=
s
>    rule, adding the following device attributes:
>    - corrected_bits (ecc_stats.corrected)
>    - uncorrectable_errors (ecc_stats.failed)

Just a minor nit-pick ..
If you are re-spinning the patch then can you rename "uncorrectable_errors"
to actual binding attribute (something like "ecc_failures"), because the er=
rors
could be due to multiple reasons like:
- uncorrectable bitflips
- timeout waiting for I/O.
- error status from flash controller | device
- ...
These all conditions are accounted in ecc_stat->failed, not alone=20
"uncorrectable" conditions.


with regards, pekon
